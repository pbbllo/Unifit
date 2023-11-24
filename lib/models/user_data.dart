abstract class IUser {
  final String name;
  final String email;

  IUser({required this.name, required this.email});

  String getName({name});
  String getEmail({email});

  void setName({name});
  void setEmail({email});

  Map toJson();
}

class UserData implements IUser {
  @override
  String email;

  @override
  String name;

  String? profilePicture;

  UserData({required this.email, required this.name, this.profilePicture});

  UserData.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        profilePicture = json['profilePicture'];

  @override
  Map<String, dynamic> toJson() =>
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
