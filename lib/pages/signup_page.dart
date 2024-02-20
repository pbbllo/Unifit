import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/unifit_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/widgets/gradient_button.dart';

class SignUpPage extends StatefulWidget {
  /// Signs up a user into the application.
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const UnifitIcon(),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.TYPE_YOUR_NAME,
                  style: TextStyle(
                    color: AppColors.MAIN_ORANGE,
                  ),
                ),
              ),
              TextField(
                controller: _usernameController,
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
                  AppStrings.TYPE_YOUR_COURSE,
                  style: TextStyle(
                    color: AppColors.MAIN_ORANGE,
                  ),
                ),
              ),
              TextField(
                controller: _courseController,
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.REPEAT_YOUR_PASSWORD,
                  style: TextStyle(
                    color: AppColors.MAIN_ORANGE,
                  ),
                ),
              ),
              TextField(
                controller: _repasswordController,
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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              GradientButton(
                text: AppStrings.SIGN_UP,
                onPressed: _signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String name = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    Future<User?> user =
        Auth.instance.signUp(email, password, name).catchError((error) {
      // TODO Error feedback

      return null;
    });

    if (user != null) {
      Auth.instance.signIn(email, password);
      Navigator.of(context).popAndPushNamed('/successful_signup');
    }
  }
}
