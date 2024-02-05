import 'package:flutter/material.dart';
import 'package:unifit/controllers/profile_picture_controller.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/unifit_icons.dart';
import 'package:unifit/widgets/web_button.dart';

class WebPage extends StatelessWidget {
  final String text;
  final Color color;
  const WebPage({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.MAIN_WHITE,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.10,
          left: screenWidth * 0.08,
          right: screenWidth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            const UnifitIcon(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                AppStrings.REGISTER_MESSAGE_TEXT4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.MAIN_BLACK,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CircleAvatar(
              radius: screenWidth * 0.13,
              foregroundImage: NetworkImage(
                ProfilePicture.instance.getImage(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            WebButton(
              text: text,
              color: color,
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/home'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.CANCEL,
                style: TextStyle(
                  color: AppColors.MAIN_GRAY,
                ),
              ),
            ),
            const Text(
              AppStrings.TERMS_MESSAGE_TEXT1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.MAIN_BLACK,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Text(
              AppStrings.TERMS_MESSAGE_TEXT2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.MAIN_BLACK,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
