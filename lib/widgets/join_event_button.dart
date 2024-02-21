import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class JoinEventButton extends StatefulWidget {
  /// Button with the application colors gradient.
  const JoinEventButton({super.key});

  @override
  State<JoinEventButton> createState() => _JoinEventButtonState();
}

class _JoinEventButtonState extends State<JoinEventButton> {
  bool hasJoin = false;
  void joinEvent() {
    setState(() {
      hasJoin = !hasJoin;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          joinEvent();
        },
        child: Ink(
          decoration: ShapeDecoration(
            color: hasJoin ? Colors.grey : AppColors.MAIN_BLUE,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: SizedBox(
            width: screenWidth * 0.64,
            height: screenHeight * 0.046,
            child: Center(
              child: hasJoin
                  ? Text(
                      AppStrings.LEAVE_EVENT.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * 0.025,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 1.2,
                      ),
                    )
                  : Text(
                      AppStrings.JOIN.toUpperCase(),
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
