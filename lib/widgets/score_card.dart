import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unifit/utils/constants.dart';

class ScoreCard extends StatelessWidget {
  /// Card that shows the score of an [Event] object.
  final String score;
  const ScoreCard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(milliseconds: 2300),
      preferBelow: false,
      richMessage: const TextSpan(
          text: AppStrings.SCORE_CARD_TOOLTIP,
          style: TextStyle(fontWeight: FontWeight.bold)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 0.3, color: const Color(0xFF947A26)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFFD700).withOpacity(0.8), // Initial color
              const Color(0xFFDAA520).withOpacity(0.8), // Intermediate color
              const Color(0xFFB8860B).withOpacity(0.8), // Final color
            ],
            stops: const [0.2, 0.9, 1],
          ),
        ),
        height: screenHeight * 0.038,
        width: screenWidth * 0.1648,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '+$score',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF947A26),
                  fontSize: screenHeight * 0.0242,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              width: screenWidth * 0.006,
            ),
            SvgPicture.asset(
              'lib/assets/layers/social_leaderboard.svg',
              width: screenWidth * 0.0515,
              height: screenHeight * 0.0242,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF947A26), BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
