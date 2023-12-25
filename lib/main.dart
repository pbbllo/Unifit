import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unifit/firebase_options.dart';
import 'package:unifit/views/home_page.dart';
import 'package:unifit/views/login_view.dart';
import 'package:unifit/views/presentation_page.dart';
import 'package:unifit/views/register.dart';
import 'package:unifit/views/register_message_page.dart';
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
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
      },
      title: AppStrings.TITLE,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.MAIN_BLUE),
        useMaterial3: true,
      ),
      home: const RegisterMessagePage(),
    );
  }
}
