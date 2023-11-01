import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const GradientButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

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
            gradient: const LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [
                Color(0xFFFE7453),
                Color(0xFFA31623),
                Color(0xFF7DF5A5),
                Color(0xFFD89438)
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
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
