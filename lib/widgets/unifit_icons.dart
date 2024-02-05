import 'package:flutter/material.dart';

class UnifitIcon extends StatelessWidget {
  const UnifitIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Image(
        width: screenWidth * 0.65,
        image: const AssetImage(
          'lib/assets/layers/unifit_logo.png',
        ),
      ),
    );
  }
}

class UnifitSportsIcon extends StatelessWidget {
  const UnifitSportsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: screenWidth * 0.65,
            image: const AssetImage(
              'lib/assets/layers/sports_icons.png',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.010,
          ),
          const UnifitIcon(),
        ],
      ),
    );
  }
}
