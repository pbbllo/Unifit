import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

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
