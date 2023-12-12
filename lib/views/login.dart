import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unifit/services/auth_service.dart';
import 'package:unifit/utils/constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/layers/sports_icons.png', width: 320.0),
            const SizedBox(height: AppBoxs.ICON_MAIN_BOX),
            Image.asset('lib/assets/layers/unifit_logo.png', width: 320.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Digite seu email:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Digite sua senha:',
                labelStyle: TextStyle(color: AppColors.SALMON),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(color: AppColors.SALMON),
                  )),
            ),
            SingleChildScrollView(
              child: ElevatedButton(
                onPressed: _signIn,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 130.0,
                      vertical: 20.0,
                    )),
                child: const Text('ENTRAR'),
              ),
            ),
            const SizedBox(height: AppBoxs.DEFAULT_BOX),
            Column(
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Ou entrar com uma conta social',
                      style: TextStyle(color: AppColors.SALMON),
                    )),
                const SizedBox(height: AppBoxs.DEFAULT_BOX),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset('lib/assets/layers/facebook_icon.png',
                          width: 60.0),
                    ),
                    const SizedBox(width: 50.0),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('lib/assets/layers/google_icon.png',
                          width: 50.0),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Future<User?> user =
        Auth.instance.signIn(email, password).catchError((error) {
      // TODO Error feedback
      return null;
    });

    if (user != null) {
      Auth.instance.signIn(email, password);
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      //TODO Error feedback
    }
  }
}
