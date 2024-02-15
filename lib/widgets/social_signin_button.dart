import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  ///
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  const SocialSignInButton(
      {super.key, required this.text, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Ink(
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: SizedBox(
            width: screenWidth * 0.69,
            height: screenHeight * 0.047,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
