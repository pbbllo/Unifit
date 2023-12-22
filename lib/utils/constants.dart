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
  static const String EMPTY = '';
  static const String TITLE = 'Unifit';
  static const String NEXT = 'Próximo';
  static const String SIGN_IN = 'ENTRAR';
  static const String SIGN_UP = 'Registre-se de graça!';
  static const String WELCOME_TEXT = 'Bem vindo ao UnitFit.';
  static const String PRESENTATION_TEXT1 =
      'A aplicação perfeita para interação universitária '
      'aliada à prática de exercícios físicos!';
  static const String PRESENTATION_TEXT2 =
      'Crie ou participe de eventos de atividades físicas ligados à UFRPE!';
  static const String PRESENTATION_TEXT3 =
      'Acompanhe e também compartilhe seu progresso diário com seus amigos!';
  static const String PRESENTATION_TEXT4 = 'E muito mais! Vamos descobrir?';
  static const String TYPE_YOUR_EMAIL = 'Digite seu email:';
  static const String TYPE_YOUR_PASSWORD = 'Digite sua senha:';
  static const String FORGOT_PASSWORD = 'Esqueceu sua senha?';
  static const String SIGN_IN_SOCIAL_MEDIA = 'Ou entrar com uma conta social';
  static const String NEW_HERE = 'Novo por aqui?';
  static const String SEARCH_HINT_TEXT = 'Buscar eventos';
  static const String HOME = 'Início';
  static const String CALENDAR = 'Calendário';
  static const String ACHIEVEMENTS = 'Conquistas';
  static const String PROFILE = 'Perfil';
  static const String EVENTS = 'Eventos';
  static const String POSTS = 'Publicações';
  static const String NO_CONNECTION = 'Sem conexão.';
  static const String LOADING = 'Carregando...';
  static const String NO_DATA_TO_LOAD = 'Não há dados para carregar.';
  static const String UNKNOWN_PROBLEM =
      'Um problema desconhecido foi encontrado.';
  static const String SCORE_CARD_TOOLTIP =
      'Participe de eventos e ganhe pontos, saiba mais na seção "Conquistas".';
}

class ErrorMessage {
  static const String UNDEFINED_MESSAGE =
      'Ocorreu um erro indefinido. Por favor, entre em contato com o suporte.';
  static const String INTERNAL_ERROR_MESSAGE =
      'Erro interno. Por favor, entre em contato com o suporte.';
  static const String EXTERNAL_ERROR_MESSAGE =
      'Erro externo. Por favor, entre em contato com o suporte.';
  static const String WEAK_PASSWORD_MESSAGE =
      'A senha não é forte o suficiente.';
  static const String INVALID_EMAIL_MESSAGE =
      'Seu endereço de e-mail está mal formatado.';
  static const String WRONG_PASSWORD_MESSAGE = 'Sua senha está incorreta.';
  static const String USER_NOT_FOUND_MESSAGE =
      'Usuário com este endereço de e-mail não existe.';
  static const String EMAIL_ALREADY_USED_MESSAGE =
      'Este endereço de e-mail já existe.';
  static const String USER_DISABLED_MESSAGE =
      'Usuário foi bloqueado pelo administrador.';

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
  static const Color MAIN_ORANGE = Color(0xFFFE7453);
}

class AppBoxes {
  static const double DEFAULT_BOX = 15.0;
  static const double ICON_MAIN_BOX = 25.0;
}
