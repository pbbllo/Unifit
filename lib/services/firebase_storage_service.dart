import 'package:firebase_storage/firebase_storage.dart';

abstract class IFirebaseStorageService {
  static final FirebaseStorage firebaseInstance = FirebaseStorage.instance;

  Future get({required String id});
  Future delete({required String id});
  Future put({required String id, dynamic value});
}

class FirebaseStorageService implements IFirebaseStorageService {
  final FirebaseStorage _firebaseStorage =
      IFirebaseStorageService.firebaseInstance;

  static final FirebaseStorageService instance = FirebaseStorageService._();

  FirebaseStorageService._();

  @override
  Future delete({required String id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> get({required String id}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put({required String id, dynamic value}) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
