import 'package:firebase_storage/firebase_storage.dart';
import 'dart:typed_data';

import 'package:unifit/utils/logging.dart';

abstract class IFirebaseStorageService {
  static final FirebaseStorage firebaseInstance = FirebaseStorage.instance;

  Future get({required String id});
  Future delete({required String id});
  Future<String> put({required String id, required Uint8List data});
}

class FirebaseStorageService implements IFirebaseStorageService {
  final Reference firebaseRef = IFirebaseStorageService.firebaseInstance.ref();

  static final FirebaseStorageService instance = FirebaseStorageService._();

  FirebaseStorageService._();

  @override
  Future<void> delete({required String id}) async {
    try {
      await firebaseRef.child(id).delete();
    } catch (error, stackTrace) {
      Logging.logError(
          'Error while deleting from Firebase Storage', stackTrace);
      rethrow;
    }
  }

  @override
  Future<String?> get({required String id}) async {
    try {
      final String downloadURL = await firebaseRef.child(id).getDownloadURL();
      return downloadURL;
    } catch (error) {
      return null;
    }
  }

  @override
  Future<String> put({required String id, required Uint8List data}) async {
    try {
      final UploadTask uploadTask = firebaseRef.child(id).putData(data);

      final TaskSnapshot snapshot = await uploadTask;

      final String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (error, stackTrace) {
      Logging.logError('Error while uploading to Firebase Storage', stackTrace);
      rethrow;
    }
  }
}
