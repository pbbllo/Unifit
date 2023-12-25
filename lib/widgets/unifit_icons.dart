import 'package:flutter/material.dart';

class ResponsiveIcon extends StatelessWidget {
  final double heightFactor;
  final double widthFactor;
  final AssetImage image;

  const ResponsiveIcon(
      {Key? key,
      required this.heightFactor,
      required this.widthFactor,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Image(
        image: image,
        height: screenHeight * heightFactor,
        width: screenWidth * widthFactor,
      ),
    );
  }
}

class UnifitIcon extends StatelessWidget {
  const UnifitIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ResponsiveIcon(
        heightFactor: 0.10,
        widthFactor: 0.87,
        image: AssetImage(
          'lib/assets/layers/unifit_logo.png',
        ),
      ),
    );
  }
}

class UnifitSportsIcon extends StatelessWidget {
  const UnifitSportsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ResponsiveIcon(
            heightFactor: 0.15,
            widthFactor: 0.87,
            image: AssetImage(
              'lib/assets/layers/sports_icons.png',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
            width: screenWidth * 0.01,
          ),
          const UnifitIcon(),
        ],
      ),
    );
  }
}
