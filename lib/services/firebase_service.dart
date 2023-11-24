import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseService {
  static final FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  Future<DocumentSnapshot> get({required String id});
  Future<void> delete({required String id});
  Future<void> put({required String id, dynamic value});
}
