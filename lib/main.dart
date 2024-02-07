import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unifit/firebase_options.dart';
import 'package:unifit/pages/home_page.dart';
import 'package:unifit/pages/signin_page.dart';
import 'package:unifit/pages/introduction_page.dart';
import 'package:unifit/pages/signup_page.dart';
import 'package:unifit/pages/successful_signup_page.dart';
import 'package:unifit/pages/signup_options_page.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/successful_signup': (context) => const SuccessfulSignupPage(),
        '/signup_options': (context) => const SignUpOptionsPage(),
      },
      title: AppStrings.TITLE,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.MAIN_BLUE),
        useMaterial3: true,
      ),
      home: const IntroductionPage(),
    );
  }
}
