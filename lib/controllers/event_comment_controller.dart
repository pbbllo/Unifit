import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/comment.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/services/firebase_service.dart';

class EventCommentController {
  /// Provides ways to handle the comments of an [Event].
  final Event event;
  EventCommentController(this.event);

  final StreamController<List<Comment>> _controller =
      StreamController<List<Comment>>();
  Stream<List<Comment>> get streamController => _controller.stream;

  void loadEventComments() async {
    DocumentSnapshot eventSnapshot = await FirebaseService.instance
        .get(id: event.id, collection: FirebaseCollectionEnum.event);
    if (eventSnapshot.exists && eventSnapshot.data() != null) {
      Event updatedEvent = Event.fromDocumentSnapshot(eventSnapshot);
      List<Comment> updatedEventComments = await updatedEvent.getComments();
      _controller.sink.add(updatedEventComments);
    }
  }
}
