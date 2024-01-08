import 'package:flutter/material.dart';

class WebButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  const WebButton(
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
          color: color,
          child: SizedBox(
            width: screenWidth * 0.64,
            height: screenHeight * 0.046,
            child: Center(
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.025,
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
