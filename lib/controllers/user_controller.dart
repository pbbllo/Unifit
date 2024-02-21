import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unifit/enums/firebase_collection_enum.dart';
import 'package:unifit/models/user_data.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/services/firebase_service.dart';
import 'package:unifit/utils/exception_handlers.dart';

class UserController {
  /// Provides useful methods to handle and provide [UserData];
  static final UserController instance = UserController._();

  UserController._();

  IUser getUserFromCurrentSession() => Auth.instance.userData;

  Future<IUser?> getUserById(String? id) async {
    DocumentSnapshot<Object?> userDoc = await FirebaseService.instance
        .get(id: id, collection: FirebaseCollectionEnum.user);
    if (userDoc.exists) {
      return UserData.fromDocumentSnapshot(userDoc);
    }
    return null;
  }

  Future<void> addUserToCollection(IUser user) async {
    if (user.id == null) {
      throw InternalApplicationError('Invalid user.');
    }
    // Checking if the user already exists:
    IUser? alreadyExistantUser = await getUserById(user.id);
    if (alreadyExistantUser == null) {
      await FirebaseService.instance.set(
          id: user.id,
          data: user.toMap(),
          collection: FirebaseCollectionEnum.user);
    }
  }
}
