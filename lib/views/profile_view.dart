import 'package:flutter/material.dart';
import 'package:unifit/controllers/profile_picture_controller.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';

class ProfileView extends StatelessWidget {
  /// Shows a successful message when the sign up occurs as expected.
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.25,
          left: screenWidth * 0.30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenWidth * 0.20,
              foregroundImage: NetworkImage(
                ProfilePicture.instance.getImage(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            TextButton(
              onPressed: () {
                Auth.instance.signOut();
                Navigator.of(context).popAndPushNamed('/signin');
              },
              child: const Text(
                AppStrings.SIGN_OUT,
                style: TextStyle(
                  color: AppColors.MAIN_GRAY,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
