import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _validadeAndSubmit() async {
  //   if (_validadeAndSave()) {
  //     final User user =
  //         await Auth.instance.signIn(_email, _password).catchError((error) {
  //       CustomFlushBar.show(
  //           context: context, title: "Login error:", message: error);
  //       return null;
  //     });
  //     if (user != null) {
  //       LogController.logInfo('${FirebaseAuth.instance.currentUser} Signed in with success.');
  //       Navigator.of(context).popAndPushNamed('/homePage');
  //     }
  //   }
  // }

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
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Digite seu email:',
                labelStyle: TextStyle(color: AppColors.MAIN_ORANGE),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Digite sua senha:',
                labelStyle: TextStyle(color: AppColors.MAIN_ORANGE),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(color: AppColors.MAIN_ORANGE),
                  )),
            ),
            SingleChildScrollView(
              child: ElevatedButton(
                onPressed: () {},
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
                      style: TextStyle(color: AppColors.MAIN_ORANGE),
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

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
}
