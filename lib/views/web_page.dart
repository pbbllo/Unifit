import 'package:flutter/material.dart';
import 'package:unifit/services/profile_picture_service.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/unifit_icons.dart';
import 'package:unifit/widgets/web_button.dart';

class WebPage extends StatelessWidget {
  final String text;
  final Color color;
  const WebPage({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.MAIN_WHITE,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.10,
          left: screenWidth * 0.08,
          right: screenWidth * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UnifitIcon(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Unifit receberá:\n suas permissões para perfil público e endereço de email',
                style: TextStyle(
                  color: AppColors.MAIN_ORANGE,
                ),
              ),
            ),
            CircleAvatar(
              foregroundImage: NetworkImage(
                ProfilePicture.instance.getImage(),
              ),
            ),
            WebButton(
              text: text,
              color: color,
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/home'),
            )
          ],
        ),
      ),
    );
  }
}
