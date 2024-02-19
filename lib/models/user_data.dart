import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IUser {
  /// Interface for the application's user.
  String? id;
  String name;
  String email;

  IUser(this.id, this.name, this.email);

  String getName({name});
  String getEmail({email});

  void setName({name});
  void setEmail({email});

  Map<String, dynamic> toMap();
}

class UserData implements IUser {
  /// Default application's user.
  @override
  String? id;

  @override
  String email;

  @override
  String name;

  String? profilePicture;

  UserData(
      {this.id, required this.name, required this.email, this.profilePicture});

  UserData.fromMap(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        profilePicture = json['profilePicture'];

  factory UserData.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return UserData(
        id: documentSnapshot.id,
        name: documentSnapshot['name'],
        email: documentSnapshot['email'],
        profilePicture: documentSnapshot['profilePicture']);
  }

  @override
  Map<String, dynamic> toMap() =>
      {'email': email, 'name': name, 'profilePicture': profilePicture};

  @override
  String getName({name}) {
    return name;
  }

  @override
  String getEmail({email}) {
    return email;
  }

  String getProfilePicture({profilePicture}) {
    return profilePicture;
  }

  @override
  void setName({name}) {
    this.name = name;
  }

  @override
  void setEmail({email}) {
    this.email = email;
  }

  void setProfilePicture({profilePicture}) {
    this.profilePicture = profilePicture;
  }
}
