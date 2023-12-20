import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/user_data.dart';
import 'package:unifit/services/event_firebase_service.dart';
import 'package:unifit/controllers/error_controller.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static final Auth instance = Auth._();

  Auth._();

  Future<User?> signUp(String email, String password, String name) async {
    User? firebaseUser;
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((credential) => credential)
        .catchError(
            (error) => throw ErrorHandlerController.signUpErrorHandling(error));

    firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      FirebaseFirestore.instance
          .collection('favorite')
          .doc(firebaseUser.uid)
          .set({});
      IUser userData = UserData(email: email, name: name);

      await FirebaseService.instance.update(
          id: firebaseUser.uid,
          value: userData.toJson(),
          collection: FirebaseCollectionEnum.user);

      await firebaseUser.sendEmailVerification();
    } else {
      throw Exception();
    }

    return firebaseUser;
  }

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email.trim(), password: password)
        .then((credential) => credential)
        .catchError(
            (error) => throw ErrorHandlerController.signInErrorHandling(error));
    return userCredential.user;
  }

  void signOut() {
    FirebaseAuth.instance.signOut().catchError(
        (error) => ErrorHandlerController.singOutErrorHandling(error));
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
