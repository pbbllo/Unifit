import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/pages/signin_confirmation_page.dart';
import 'package:unifit/widgets/gradient_button.dart';
import 'package:unifit/widgets/social_signin_widget.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/widgets/unifit_icons.dart';

class SignUpOptionsPage extends StatefulWidget {
  /// Shows different options to sign up into the application.
  const SignUpOptionsPage({super.key});

  @override
  SignUpOptionsPageState createState() => SignUpOptionsPageState();
}

class SignUpOptionsPageState extends State<SignUpOptionsPage> {
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
              height: screenHeight * 0.10,
            ),
            Text(
              AppStrings.SIGNUP_MESSAGE_TEXT2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.025,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            GradientButton(
              onPressed: () => Navigator.of(context).popAndPushNamed('/signup'),
              text: AppStrings.SIGNUP_WITH_EMAIL,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              AppStrings.SIGNUP_MESSAGE_TEXT3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.025,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            SocialSignInWidget(
              onPressedFacebook: () {},
              onPressedGoogle: _joinWithGoogleAccount,
            ),
          ],
        ),
      ),
    );
  }

  void _joinWithGoogleAccount() async {
    try {
      final user = await Auth.instance.signInWithGoogle();
      if (user != null && mounted) {
        String? userName = user.displayName;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignInConfirmationPage(
              text: '${AppStrings.CONTINUE_SIGN_IN_TEXT} $userName',
              color: AppColors.MAIN_RED,
            ),
          ),
        );
      }
      // ignore: empty_catches
    } on FirebaseAuthException catch (error) {
      //TODO IMPLEMENTATION
      Logging.logError(error.message.toString());
    } catch (error) {
      //TODO IMPLEMENTATION
      //Needs to show to user, this way we only showing on terminal
      Logging.logError(error.toString());
    }
  }

  void signUpFacebook() {}
}
