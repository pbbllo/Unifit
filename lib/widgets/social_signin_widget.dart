import 'package:flutter/material.dart';

class SocialSignInWidget extends StatelessWidget {
  /// Shows views of the third-party authentication options.
  final VoidCallback? onPressedFacebook;
  final VoidCallback? onPressedGoogle;
  const SocialSignInWidget({
    super.key,
    this.onPressedGoogle,
    this.onPressedFacebook,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPressedFacebook, //TODO IMPLEMENTATION
            child: Image.asset(
              'lib/assets/layers/facebook_icon.png',
              height: screenHeight * 0.10,
              width: screenWidth * 0.26,
            ),
          ),
          SizedBox(
            width: screenHeight * 0.05,
          ),
          InkWell(
            onTap: onPressedGoogle, //TODO IMPLEMENTATION
            child: Image.asset(
              'lib/assets/layers/google_icon.png',
              height: screenHeight * 0.10,
              width: screenWidth * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}
