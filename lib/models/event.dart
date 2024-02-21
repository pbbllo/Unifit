import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/models/comment.dart';

class Event {
  /// Model representing an event.
  String? id;
  String title;
  String description;
  Timestamp creationDate;
  Timestamp eventDate;
  bool isLiked;
  List<DocumentReference> comments;

  Event._(this.id, this.title, this.description, this.creationDate,
      this.eventDate, this.isLiked, this.comments) {
    // ignore: dead_null_aware_expression
    creationDate ??= Timestamp.now();
  }

  factory Event.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    List<dynamic> commentsData = documentSnapshot['comments'] ?? [];
    List<DocumentReference<Object?>> comments = commentsData
        .map((comment) => comment as DocumentReference<Object?>)
        .toList();
    return Event._(
        documentSnapshot.id,
        documentSnapshot['title'],
        documentSnapshot['description'],
        documentSnapshot['creationDate'],
        documentSnapshot['eventDate'],
        documentSnapshot['isLiked'],
        comments);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> event = {
      'title': title,
      'description': description,
      'creationDate': creationDate,
      'eventDate': eventDate,
      'comments': comments.map((comment) => comment).toList(),
    };
    return event;
  }

  Future<List<Comment>> getEventComments() async {
    List<DocumentSnapshot> commentSnaps = await Future.wait(
        comments.map((commentReference) async => await commentReference.get()));
    List<Comment> loadedComments = commentSnaps
        .map((commentSnap) => commentSnap.exists
            ? Comment.fromDocumentSnapshot(commentSnap)
            : null)
        .where((comment) => comment != null)
        .cast<Comment>()
        .toList();
    loadedComments.sort((a, b) => a.creationDate.compareTo(b.creationDate));
    return loadedComments;
  }
}
