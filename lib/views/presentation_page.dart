import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/views/login_page.dart';
import 'package:unifit/widgets/gradient_button.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Center(child: TransitionalPresentation()),
    );
  }
}

class TransitionalPresentation extends StatefulWidget {
  const TransitionalPresentation({Key? key}) : super(key: key);

  @override
  State<TransitionalPresentation> createState() =>
      _TransitionalPresentationState();
}

class _TransitionalPresentationState extends State<TransitionalPresentation> {
  bool _showTopCenter = false;
  bool _showText = false;
  String _welcomeText = AppStrings.WELCOME_TEXT;
  String _presentationText = AppStrings.PRESENTATION_TEXT1;
  int _pressedCount = 0;
  Widget _presentationImage = Container();

  @override
  void initState() {
    super.initState();
    // Trigger the transition to top center when the widget is first built
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showTopCenter = true;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _showText = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      AnimatedPositioned(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        top: _showTopCenter ? screenHeight / 5 : screenHeight / 3,
        left: (screenWidth - screenWidth * 0.65) / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/layers/sports_icons.png',
                width: screenWidth * 0.65),
            Image.asset('lib/assets/layers/unifit_logo.png',
                width: screenWidth * 0.65),
            _showText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.025),
                      SizedBox(
                        height: screenHeight * 0.034,
                        width: screenWidth * 0.65,
                        child: Text(
                          _welcomeText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: screenHeight * 0.029,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'EncodeSans'),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.65,
                        child: Text(
                          _presentationText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: screenHeight * 0.024,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'EncodeSans'),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.31,
                        width: screenWidth * 0.65,
                        child: _presentationImage,
                      ),
                      GradientButton(
                        text: AppStrings.NEXT,
                        onPressed: () {
                          setState(() {
                            switch (_pressedCount) {
                              case 0:
                                _welcomeText = '';
                                _presentationText =
                                    AppStrings.PRESENTATION_TEXT2;
                                _presentationImage =
                                    Image.asset('lib/assets/layers/'
                                        'presentation_image_group1.png');
                                _pressedCount++;
                                break;
                              case 1:
                                _presentationText =
                                    AppStrings.PRESENTATION_TEXT3;
                                _presentationImage =
                                    Image.asset('lib/assets/layers/'
                                        'presentation_image_group2.png');
                                _pressedCount++;
                                break;
                              case 2:
                                _presentationText =
                                    AppStrings.PRESENTATION_TEXT4;
                                _presentationImage = Container();
                                _pressedCount++;
                                break;
                              default:
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                            }
                          });
                        },
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    ]);
  }
}
