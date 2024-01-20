import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/views/web_page.dart';
import 'package:unifit/widgets/gradient_button.dart';
import 'package:unifit/widgets/signup_web.dart';
import 'package:unifit/widgets/unifit_icons.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    User? user;

    return Scaffold(
        backgroundColor: AppColors.MAIN_BLUE,
        body: SingleChildScrollView(
          child: Padding(
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
                  height: screenHeight * 0.02,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.TYPE_YOUR_EMAIL,
                    style: TextStyle(
                      color: AppColors.MAIN_ORANGE,
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.TYPE_YOUR_PASSWORD,
                    style: TextStyle(
                      color: AppColors.MAIN_ORANGE,
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed:
                        () {}, // TODO: Implementação para esqueceu a senha
                    child: const Text(
                      AppStrings.FORGOT_PASSWORD,
                      style: TextStyle(
                        color: AppColors.MAIN_ORANGE,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.MAIN_ORANGE,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ),
                GradientButton(
                  onPressed: _signIn,
                  text: AppStrings.SIGN_IN,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.SIGN_IN_SOCIAL_MEDIA,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SignInWebIcon(onPressedGoogle: _joinWithGoogleAccount),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppStrings.NEW_HERE,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/register_options'),
                      child: const Text(
                        AppStrings.SIGN_UP_FREE,
                        style: TextStyle(
                          color: AppColors.MAIN_ORANGE,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.MAIN_ORANGE,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await Auth.instance.signIn(email, password).catchError((error) {
      // TODO: Feedback de erro
      return null;
    });

    if (user != null) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      // TODO: Feedback de erro
    }
  }

  void _joinWithGoogleAccount() async {
    try {
      final user = await Auth.instance.signInWithGoogle();
      if (user != null && mounted) {
        String? userName = user.displayName;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WebPage(
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

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
}
