import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final DocumentReference authorId;
  final String content;
  final Timestamp creationDate;

  Comment(this.id, this.authorId, this.content, this.creationDate);

  factory Comment.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Comment(documentSnapshot.id, documentSnapshot['authorId'],
        documentSnapshot['content'], documentSnapshot['creationDate']);
  }
}
