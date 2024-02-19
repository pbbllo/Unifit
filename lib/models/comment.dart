import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  /// Model representing a comment.
  String? id;
  DocumentReference authorId;
  String content;
  Timestamp creationDate;

  Comment(
      {this.id,
      required this.authorId,
      required this.content,
      required this.creationDate}) {
    // ignore: dead_null_aware_expression
    creationDate ??= Timestamp.now();
  }

  factory Comment.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Comment(
        id: documentSnapshot.id,
        authorId: documentSnapshot['authorId'],
        content: documentSnapshot['content'],
        creationDate: documentSnapshot['creationDate']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> comment = {
      'authorId': authorId,
      'content': content,
      'creationDate': creationDate,
    };
    return comment;
  }
}
