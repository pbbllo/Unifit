import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/interfaces/firebase_service_interface.dart';
import 'package:unifit/utils/exception_handlers.dart';

class FirebaseService implements IFirebaseService {
  /// Provides methods to interact with Firebase collections.
  final CollectionReference _eventCollection = IFirebaseService.firebaseInstance
      .collection(FirebaseCollectionEnum.event.name);
  final CollectionReference _userCollection = IFirebaseService.firebaseInstance
      .collection(FirebaseCollectionEnum.user.name);
  final CollectionReference _commentCollection = IFirebaseService
      .firebaseInstance
      .collection(FirebaseCollectionEnum.comment.name);

  static final FirebaseService instance = FirebaseService._();

  FirebaseService._();

  CollectionReference getCollection(
      {required FirebaseCollectionEnum collection}) {
    switch (collection) {
      case FirebaseCollectionEnum.event:
        return _eventCollection;
      case FirebaseCollectionEnum.comment:
        return _commentCollection;
      case FirebaseCollectionEnum.user:
        return _userCollection;
    }
  }

  @override
  Future<DocumentReference> add({
    required Map<String, dynamic> data,
    required FirebaseCollectionEnum collection,
  }) async {
    return await getCollection(collection: collection).add(data);
  }

  @override
  Future<DocumentSnapshot<Object?>> get(
      {String? id, required FirebaseCollectionEnum collection}) async {
    if (id == null) {
      throw InternalApplicationError('Document ID wasn\'t provided');
    }
    DocumentSnapshot document =
        await getCollection(collection: collection).doc(id).get();
    return document;
  }

  @override
  Future<void> set(
      {String? id,
      Map<String, dynamic>? data,
      required FirebaseCollectionEnum collection}) async {
    if (id != null && data != null) {
      await getCollection(collection: collection).doc(id).set(data);
    }
  }

  @override
  Future<void> update(
      {String? id,
      Map<String, dynamic>? data,
      required FirebaseCollectionEnum collection}) async {
    if (id != null && data != null) {
      await getCollection(collection: collection).doc(id).update(data);
    }
  }

  @override
  Future<void> delete(
      {String? id, required FirebaseCollectionEnum collection}) async {
    if (id != null) {
      await getCollection(collection: collection).doc(id).delete();
    }
  }

  Future<Map<String, dynamic>?> getDocumentByMapValues(
    Map<String, dynamic> values,
    CollectionReference collectionReference,
  ) async {
    Query query = collectionReference;

    // Construir a consulta com base nos valores do mapa
    values.forEach((key, value) {
      query = query.where(key, isEqualTo: value);
    });

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        if (values.entries.every((entry) {
          final Map<String, dynamic>? data =
              documentSnapshot.data() as Map<String, dynamic>?;

          return data != null &&
              data.containsKey(entry.key) &&
              data[entry.key] == entry.value;
        })) {
          return documentSnapshot.data() as Map<String, dynamic>;
        }
      }
    }

    return null;
  }
}
