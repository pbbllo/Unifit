import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class UnifitIcon extends StatelessWidget {
  const UnifitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('lib/assets/layers/unifit_logo.png'),
                width: 320.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
