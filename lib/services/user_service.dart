import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/services/firebase_service.dart';

class UserFirebaseService implements IFirebaseService {
  final CollectionReference _userServiceCollection =
      IFirebaseService.firebaseInstance.collection('user');

  static final UserFirebaseService instance = UserFirebaseService._();
  UserFirebaseService._();

  @override
  Future<void> delete({required String id}) async {
    await _userServiceCollection.doc(id).delete();
  }

  @override
  Future<DocumentSnapshot> get({required String id}) async {
    DocumentSnapshot documentSnapshot =
        await _userServiceCollection.doc(id).get();

    return documentSnapshot;
  }

  @override
  Future<void> put({required String id, value}) async {
    return await _userServiceCollection.doc(id).set(value);
  }
}
