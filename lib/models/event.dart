import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

/// Model representing an event.

class Event {
  final String id;
  final String title;
  final String description;
  final Timestamp creationDate;
  final Timestamp eventDate;
  bool isLiked;
  final List<DocumentReference> comments;
  Event(this.id, this.title, this.description, this.creationDate,
      this.eventDate, this.isLiked, this.comments);

  factory Event.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    List<dynamic> commentsData = documentSnapshot['comments'] ?? [];
    List<DocumentReference<Object?>> comments = commentsData
        .map((comment) => comment as DocumentReference<Object?>)
        .toList();
    print('ID: ${documentSnapshot.id}');
    return Event(
        documentSnapshot.id,
        documentSnapshot['title'],
        documentSnapshot['description'],
        documentSnapshot['creationDate'],
        documentSnapshot['eventDate'],
        documentSnapshot['isLiked'],
        comments);
  }

  String getEventDate({String? format}) {
    format = (format == null || format.isEmpty) ? 'dd/MM' : format;
    DateTime dateTime = eventDate.toDate();
    String formattedDate = DateFormat('dd/MM').format(dateTime);
    return formattedDate;
  }

  String getCreationDate({String? format}) {
    format = (format == null || format.isEmpty) ? 'dd/MM/yy' : format;
    DateTime dateTime = creationDate.toDate();
    String formattedDate = DateFormat('dd/MM/yy').format(dateTime);
    return formattedDate;
  }
}
