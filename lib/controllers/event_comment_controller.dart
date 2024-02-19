import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/controllers/user_controller.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/comment.dart';
import 'package:unifit/models/event.dart';
import 'package:unifit/models/user_data.dart';
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
      List<Comment> updatedEventComments =
          await updatedEvent.getEventComments();
      _controller.sink.add(updatedEventComments);
    }
  }

  /// Creates a new comment for the instances' [Event]
  Future<void> createEventComment(String commentText, IUser user) async {
    DocumentReference userDocumentReference = await FirebaseService.instance
        .get(id: user.id, collection: FirebaseCollectionEnum.user)
        .then((value) => value.reference);

    Timestamp creationDate = Timestamp.now();
    Comment newComment = Comment(
        authorId: userDocumentReference,
        content: commentText,
        creationDate: creationDate);

    DocumentReference addedComment = await FirebaseService.instance.add(
        data: newComment.toMap(), collection: FirebaseCollectionEnum.comment);
    event.comments.add(addedComment);
    FirebaseService.instance.update(
        id: event.id,
        data: event.toMap(),
        collection: FirebaseCollectionEnum.event);
  }
}
