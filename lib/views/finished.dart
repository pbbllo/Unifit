import 'package:flutter/material.dart';
import 'package:unifit/utils/constants.dart';
import 'package:unifit/widgets/gradient_button.dart';
import 'package:unifit/widgets/unifit_sports.dart';

class FinishedView extends StatelessWidget {
  const FinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.MAIN_BLUE,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UnifitSportsIcon(),
            Text(
              'Seu cadastro foi realizado com sucesso.\n Vamos começar!',
              style: TextStyle(),
            ),
            GradientButton(
              text: 'VOLTAR AO LOGIN',
            ),
          ],
        ),
      ),
    );
  }
}
