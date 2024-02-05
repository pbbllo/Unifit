import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/gradient_button.dart';
import 'package:unifit/widgets/unifit_icons.dart';

class RegisterMessagePage extends StatelessWidget {
  const RegisterMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.10,
          left: screenWidth * 0.08,
          right: screenWidth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UnifitSportsIcon(),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              AppStrings.SUCCESS_TEXT,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * 0.038,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              AppStrings.REGISTER_MESSAGE_TEXT1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.025,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            GradientButton(
              onPressed: () => Navigator.of(context).popAndPushNamed('/login'),
              text: AppStrings.BACK_TO_LOGIN,
            ),
          ],
        ),
      ),
    );
  }
}
