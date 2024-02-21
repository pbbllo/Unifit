import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unifit/controllers/user_controller.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/user_data.dart';
import 'package:unifit/services/firebase_service.dart';
import 'package:unifit/utils/exception_handlers.dart';
import 'package:unifit/utils/logging.dart';

class Auth {
  /// Handles application's authentication.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late IUser userData;

  static final Auth instance = Auth._();

  Auth._();

  Future<User?> signUp(String email, String password, String name) async {
    User? firebaseUser;
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((credential) => credential)
        .catchError(
            (error) => throw ExceptionHandler.signUpErrorHandling(error));

    firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      FirebaseFirestore.instance
          .collection('favorite')
          .doc(firebaseUser.uid)
          .set({});

      userData = UserData(id: firebaseUser.uid, email: email, name: name);
      await UserController.instance.addUserToCollection(userData);

      await firebaseUser.sendEmailVerification();
    } else {
      String message = 'Error while sending e-mail verification.';
      Logging.logError(message);
      throw InternalApplicationError(message);
    }

    return firebaseUser;
  }

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email.trim(), password: password)
        .then((credential) => credential)
        .catchError(
            (error) => throw ExceptionHandler.signInErrorHandling(error));
    DocumentSnapshot<Object?> userDoc = await FirebaseService.instance.get(
        id: userCredential.user?.uid, collection: FirebaseCollectionEnum.user);
    userData = UserData.fromDocumentSnapshot(userDoc);
    return userCredential.user;
  }

  void signOut() {
    FirebaseAuth.instance
        .signOut()
        .catchError((error) => ExceptionHandler.singOutErrorHandling(error));
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<User?> signInWithGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();
    final googleAuth = await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    final userCredential = await _firebaseAuth.signInWithCredential(
      credential,
    );
    IUser? currentUser =
        await UserController.instance.getUserById(userCredential.user?.uid);

    if (currentUser == null) {
      IUser newUser = UserData(
          id: userCredential.user?.uid,
          name: userCredential.user?.displayName ?? '',
          email: userCredential.user?.email ?? '',
          profilePicture: userCredential.user?.photoURL);
      await UserController.instance.addUserToCollection(newUser);
      userData = newUser;
    }
    // userData = UserData.fromDocumentSnapshot(userDoc);
    return userCredential.user;
  }
}
