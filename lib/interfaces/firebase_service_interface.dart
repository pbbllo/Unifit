import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';

abstract class IFirebaseService {
  /// Interface for handle Firebase collections and documents.
  static final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  Future<DocumentSnapshot> get(
      {required String id, required FirebaseCollectionEnum collection});
  Future<void> set(
      {required String id,
      dynamic value,
      required FirebaseCollectionEnum collection});
  Future<void> delete(
      {required String id, required FirebaseCollectionEnum collection});
  Future<void> update(
      {required String id,
      dynamic value,
      required FirebaseCollectionEnum collection});
}
