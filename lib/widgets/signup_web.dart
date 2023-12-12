import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class UnifitIcon extends StatelessWidget {
  const UnifitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Center(
        child: Row(
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
              child:
                  Image.asset('lib/assets/layers/google_icon.png', width: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}
