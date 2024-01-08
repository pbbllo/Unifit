import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: screenHeight * 0.025),
          const CircularProgressIndicator(),
          SizedBox(height: screenHeight * 0.025),
          const Text(AppStrings.LOADING)
        ],
      ),
    );
  }
}
