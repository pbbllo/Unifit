import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/interfaces/firebase_service_interface.dart';

class FirebaseService implements IFirebaseService {
  /// Provides methods to interact with Firebase collections.
  final CollectionReference _eventCollection = IFirebaseService.firebaseInstance
      .collection(FirebaseCollectionEnum.event.name);
  final CollectionReference _userCollection = IFirebaseService.firebaseInstance
      .collection(FirebaseCollectionEnum.user.name);

  static final FirebaseService instance = FirebaseService._();

  FirebaseService._();

  CollectionReference getCollection(
      {required FirebaseCollectionEnum collection}) {
    switch (collection) {
      case FirebaseCollectionEnum.event:
        return _eventCollection;
      case FirebaseCollectionEnum.user:
        return _userCollection;
    }
  }

  @override
  Future<DocumentSnapshot<Object?>> get(
      {required String id, required FirebaseCollectionEnum collection}) async {
    DocumentSnapshot document =
        await getCollection(collection: collection).doc(id).get();
    return document;
  }

  @override
  Future<void> set(
      {required String id,
      value,
      required FirebaseCollectionEnum collection}) async {
    await getCollection(collection: collection).doc(id).set(value);
  }

  @override
  Future<void> update(
      {required String id,
      value,
      required FirebaseCollectionEnum collection}) async {
    await getCollection(collection: collection).doc(id).update(value);
  }

  @override
  Future<void> delete(
      {required String id,
      value,
      required FirebaseCollectionEnum collection}) async {
    await getCollection(collection: collection).doc(id).delete();
  }
}
