import 'package:flutter/material.dart';
// ignore_for_file: constant_identifier_names

enum SignOutError {
  userInvalidError('The user belongs to a diffent Firebase project.'),
  userExpiredError('The user is expired'),
  userNotFoundError('The user was not found.'),
  userUnmatchError(
      "User's tenant ID does not match the underlying Auth instance's configured tenant ID.");

  final String message;
  const SignOutError(this.message);
}

class AppStrings {
  static const String TITLE = 'Unifit';
  static const String NEXT = 'Próximo';
  static const String WELCOME_TEXT = 'Bem vindo ao UnitFit.';
  static const String PRESENTATION_TEXT1 =
      'A aplicação perfeita para interação universitária '
      'aliada à prática de exercícios físicos!';
  static const String PRESENTATION_TEXT2 =
      'Crie ou participe de eventos de atividades físicas ligados à UFRPE!';
  static const String PRESENTATION_TEXT3 =
      'Acompanhe e também compartilhe seu progresso diário com seus amigos!';
  static const String PRESENTATION_TEXT4 = 'E muito mais! Vamos descobrir?';
}

class ErrorMessage {
  static const String UNDEFINED_MESSAGE =
      'An undefined error happened. Please contact the support.';
  static const String INTERNAL_ERROR_MESSAGE =
      'Internal error. Please contact the support.';
  static const String EXTERNAL_ERROR_MESSAGE =
      'External error. Please contact the support.';
  static const String WEAK_PASSWORD_MESSAGE =
      'The password is not strong enough.';
  static const String INVALID_EMAIL_MESSAGE =
      'Your email address appears to be malformed.';
  static const String WRONG_PASSWORD_MESSAGE = 'Your password is wrong.';
  static const String USER_NOT_FOUND_MESSAGE =
      'User with this email address does not exist.';
  static const String EMAIL_ALREADY_USED_MESSAGE =
      'This email address already exists.';
  static const String USER_DISABLED_MESSAGE = 'User was blocked by admin';

  static const String UNDEFINED_LOG = 'Undefined error';
  static const String EMAIL_ALREADY_USED_LOG =
      'The email address is not valid.';
  static const String INVALID_EMAIL_LOG = 'Invalid email.';
  static const String WRONG_PASSWORD_LOG = 'Wrong password.';
  static const String WEAK_PASSWORD_LOG =
      'Provided password did not match with strong password requirements.';
  static const String USER_NOT_FOUND_LOG = 'User not found.';
  static const String USER_DISABLED_LOG = 'User is disabled';
  static const String CREDENTIALS_FIREBASE_ERROR_LOG =
      'Email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.';
}

class AppColors {
  static const Color MAIN_BLUE = Color(0xFF010C2D);
  static const Color SALMON = Color(0xFFFE7453);
}

class AppBoxs {
  static const double DEFAULT_BOX = 15.0;
  static const double ICON_MAIN_BOX = 25.0;
}
