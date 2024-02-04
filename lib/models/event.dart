import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/models/comment.dart';

/// Model representing an event.

class Event {
  final String id;
  final String title;
  final String description;
  final Timestamp creationDate;
  final Timestamp eventDate;
  bool isLiked;
  final List<DocumentReference> _comments;

  Event._(this.id, this.title, this.description, this.creationDate,
      this.eventDate, this.isLiked, this._comments);

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

  Future<List<Comment>> getComments() async {
    List<DocumentSnapshot> commentSnaps = await Future.wait(_comments
        .map((commentReference) async => await commentReference.get()));
    List<Comment> comments = commentSnaps
        .map((commentSnap) => commentSnap.exists
            ? Comment.fromDocumentSnapshot(commentSnap)
            : null)
        .where((comment) => comment != null)
        .cast<Comment>()
        .toList();
    comments.sort((a, b) => a.creationDate.compareTo(b.creationDate));
    return comments;
  }
}
