import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/unifit.dart';

class UnifitSportsIcon extends StatelessWidget {
  const UnifitSportsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UnifitIcon(),
            SizedBox(
              height: AppBoxs.ICON_MAIN_BOX,
            ),
            Center(
              child: Image(
                image: AssetImage('lib/assets/layers/sports_icons.png'),
                width: 320.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
