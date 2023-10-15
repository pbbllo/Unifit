import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'home.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Home(
                    title: AppStrings.TITLE,
                  )),
        );
      },
    );

    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('lib/assets/layers/sports_icons.png', width: 320.0),
          Image.asset('lib/assets/layers/unifit_logo.png', width: 320.0)
        ],
      )),
    );
  }
}
