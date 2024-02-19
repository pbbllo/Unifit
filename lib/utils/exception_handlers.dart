import 'package:firebase_auth/firebase_auth.dart';
import 'package:unifit/utils/logging.dart';
import 'package:unifit/utils/constants.dart';

class ExceptionHandler {
  /// Application's exception handler.
  static String signUpErrorHandling(FirebaseAuthException error) {
    late String errorMessage;
    late String loggedMessage;

    switch (error.code) {
      case "email-already-in-use":
        errorMessage = AppStrings.EMAIL_ALREADY_USED_MESSAGE;
        loggedMessage = LoggingStrings.EMAIL_ALREADY_USED_ERROR;
        break;
      case "invalid-email":
        errorMessage = AppStrings.INVALID_EMAIL_MESSAGE;
        loggedMessage = LoggingStrings.INVALID_EMAIL_ERROR;
        break;
      case "operation-not-allowed":
        errorMessage = AppStrings.EXTERNAL_ERROR_MESSAGE;
        loggedMessage = LoggingStrings.CREDENTIALS_FIREBASE_ERROR_ERROR;
        break;
      case "weak-password":
        errorMessage = AppStrings.WEAK_PASSWORD_MESSAGE;
        loggedMessage = LoggingStrings.WEAK_PASSWORD_ERROR;
        break;
      default:
        errorMessage = AppStrings.UNDEFINED_MESSAGE;
        loggedMessage = LoggingStrings.UNDEFINED_ERROR;
    }

    Logging.logWarning(loggedMessage);
    return errorMessage;
  }

  static String signInErrorHandling(FirebaseAuthException error) {
    late String loggedMessage;
    late String errorMessage;

    switch (error.code) {
      case "invalid-email":
        errorMessage = AppStrings.INVALID_EMAIL_MESSAGE;
        loggedMessage = LoggingStrings.INVALID_EMAIL_ERROR;
        break;
      case "wrong-password":
        errorMessage = AppStrings.WRONG_PASSWORD_MESSAGE;
        loggedMessage = LoggingStrings.INVALID_EMAIL_ERROR;
        break;
      case "user-not-found":
        errorMessage = AppStrings.USER_NOT_FOUND_MESSAGE;
        loggedMessage = LoggingStrings.USER_NOT_FOUND_ERROR;
        break;
      case "user-disabled":
        errorMessage = AppStrings.USER_DISABLED_MESSAGE;
        loggedMessage = LoggingStrings.USER_DISABLED_ERROR;
        break;
      default:
        errorMessage = AppStrings.UNDEFINED_MESSAGE;
        loggedMessage = LoggingStrings.UNDEFINED_ERROR;
    }
    Logging.logWarning(loggedMessage);
    return errorMessage;
  }

  static void singOutErrorHandling(FirebaseAuthException error) {
    String loggedMessage;

    switch (error.code) {
      case "invalid-user-token":
        loggedMessage = LoggingStrings.USER_INVALID_ERROR;
        break;
      case "user-token-expired":
        loggedMessage = LoggingStrings.USER_EXPIRED_ERROR;
        break;
      case "null-user":
        loggedMessage = LoggingStrings.USER_NOT_FOUND_ERROR;
        break;
      case "tenant-id-mismatch":
        loggedMessage = LoggingStrings.USER_UNMATCH_ERROR;
        break;
      default:
        loggedMessage = LoggingStrings.UNDEFINED_ERROR;
    }

    Logging.logWarning(loggedMessage);
  }
}

class InternalApplicationError implements Exception {
  final String message;

  InternalApplicationError([this.message = AppStrings.EMPTY]);

  @override
  String toString() {
    return 'InternalApplicationError: $message';
  }
}
