import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/firebase_storage_service.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/services/firebase_service.dart';

class EventController {
  /// Provides ways to handle [Event] objects.
  List<DocumentSnapshot> documentList = [];
  bool isLoading = false;
  bool hasMore = true;
  int documentLimit = 20;
  DocumentSnapshot? lastDocument;
  final ScrollController scrollController = ScrollController();

  final StreamController<List<DocumentSnapshot>> _controller =
      StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get streamController => _controller.stream;

  void loadEvents() async {
    QuerySnapshot querySnapshot;
    if (lastDocument == null) {
      querySnapshot = await FirebaseService.instance
          .getCollection(collection: FirebaseCollectionEnum.event)
          .limit(documentLimit)
          .get();
    } else {
      Logging.logInfo('Limit reached, loading more 20 items...');
      querySnapshot = await FirebaseService.instance
          .getCollection(collection: FirebaseCollectionEnum.event)
          .startAfterDocument(lastDocument!)
          .limit(documentLimit)
          .get();
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    documentList.addAll(querySnapshot.docs);
    _controller.sink.add(documentList);
  }

  static void toggleIsLiked(Event event) {
    event.isLiked = !event.isLiked;
    // TODO: This should be added in user info instead.
    FirebaseService.instance.update(
        id: event.id,
        collection: FirebaseCollectionEnum.event,
        data: {'isLiked': event.isLiked});
  }

  static Future<String?> getEventImage(String? eventId) async {
    if (eventId != null) {
      String fileStorageId = 'event/$eventId.jpg';
      String? imageURL =
          await FirebaseStorageService.instance.get(id: fileStorageId);
      return imageURL;
    }
    return null;
  }
}
