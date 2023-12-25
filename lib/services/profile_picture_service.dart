import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
<<<<<<< HEAD
<<<<<<< Updated upstream
import 'package:unifit/models/data/user_data.dart';
import 'package:unifit/services/user_service.dart';
=======
>>>>>>> Stashed changes
import 'package:unifit/services/firebase_storage_service.dart';
=======
>>>>>>> 74ee49285257b01f5d618e87370594deb2f8686b

class ProfilePicture {
  static final ProfilePicture instance = ProfilePicture._(); //singleton

  ProfilePicture._(); //private constructor

  late Map<String, dynamic> userDocument;
  late String imageFirebase;
  late final picker = ImagePicker();
  late final User? _firebaseUser = FirebaseAuth.instance.currentUser;

  Future updateProfilePicture(File profilePicture) async {
    //TODO
  }

  Future getImage() async {
    //TODO
  }

  Future setImage(Function refreshState) async {
    //TODO
  }
}
