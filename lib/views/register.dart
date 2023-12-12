import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/gradient_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/layers/unifit_logo.png', width: 320.0),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Digite seu nome:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              controller: _courseController,
              decoration: const InputDecoration(
                labelText: 'Digite seu curso:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Digite seu email:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Digite sua senha:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _repasswordController,
              decoration: const InputDecoration(
                labelText: 'Repita sua senha:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            const SizedBox(height: AppBoxs.ICON_MAIN_BOX),
            SingleChildScrollView(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 130.0,
                    vertical: 20.0,
                  ),
                ),
                child: GradientButton(
                  text: 'REGISTRAR',
                  onPressed: _signUp,
                ),
              ),
            ),
          ],
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
      Navigator.of(context).popAndPushNamed('/home');
    }
  }
}
