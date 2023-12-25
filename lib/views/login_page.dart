import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/gradient_button.dart';
import 'package:unifit/widgets/signup_web.dart';
import 'package:unifit/widgets/unifit_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.15,
          left: screenWidth * 0.09,
          right: screenWidth * 0.09,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UnifitSportsIcon(),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: AppStrings.TYPE_YOUR_EMAIL,
                  labelStyle: TextStyle(
                    color: AppColors.MAIN_ORANGE,
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: AppStrings.TYPE_YOUR_PASSWORD,
                  labelStyle: TextStyle(
                    color: AppColors.MAIN_ORANGE,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {}, // TODO: Implementação para esqueceu a senha
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
              SizedBox(
                height: screenHeight * 0.01,
              ), // Adicionado um espaço para separar os widgets
              GradientButton(
                onPressed: _signIn,
                text: AppStrings.SIGN_IN,
              ),
              SizedBox(
                height: screenHeight * 0.03,
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
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const SignInWebIcon(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.NEW_HERE,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.01,
                  ),
                  const Text(
                    AppStrings.SIGN_UP,
                    style: TextStyle(
                      color: AppColors.MAIN_ORANGE,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.MAIN_ORANGE,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
}
