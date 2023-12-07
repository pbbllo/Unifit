import 'package:firebase_auth/firebase_auth.dart';
import 'package:unifit/controllers/log_controller.dart';
import 'package:unifit/utils/constants.dart';

class ErrorHandlerController {
  static String signUpErrorHandling(FirebaseAuthException error) {
    late String errorMessage;
    late String errorLog;

    switch (error.code) {
      case "email-already-in-use":
        errorMessage = ErrorMessage.EMAIL_ALREADY_USED_MESSAGE;
        errorLog = ErrorMessage.EMAIL_ALREADY_USED_LOG;
        break;
      case "invalid-email":
        errorMessage = ErrorMessage.INVALID_EMAIL_MESSAGE;
        errorLog = ErrorMessage.INVALID_EMAIL_LOG;
        break;
      case "operation-not-allowed":
        errorMessage = ErrorMessage.EXTERNAL_ERROR_MESSAGE;
        errorLog = ErrorMessage.CREDENTIALS_FIREBASE_ERROR_LOG;
        break;
      case "weak-password":
        errorMessage = ErrorMessage.WEAK_PASSWORD_MESSAGE;
        errorLog = ErrorMessage.WEAK_PASSWORD_LOG;
        break;
      default:
        errorMessage = ErrorMessage.UNDEFINED_MESSAGE;
        errorLog = ErrorMessage.UNDEFINED_LOG;
    }

    LogController.logWarning(errorLog);
    return errorMessage;
  }

  static String signInErrorHandling(FirebaseAuthException error) {
    late String errorLog;
    late String errorMessage;

    switch (error.code) {
      case "invalid-email":
        errorMessage = ErrorMessage.INVALID_EMAIL_MESSAGE;
        errorLog = ErrorMessage.INVALID_EMAIL_LOG;
        break;
      case "wrong-password":
        errorMessage = ErrorMessage.WRONG_PASSWORD_MESSAGE;
        errorLog = ErrorMessage.INVALID_EMAIL_LOG;
        break;
      case "user-not-found":
        errorMessage = ErrorMessage.USER_NOT_FOUND_MESSAGE;
        errorLog = ErrorMessage.USER_NOT_FOUND_LOG;
        break;
      case "user-disabled":
        errorMessage = ErrorMessage.USER_DISABLED_MESSAGE;
        errorLog = ErrorMessage.USER_DISABLED_LOG;
        break;
      default:
        errorMessage = ErrorMessage.UNDEFINED_MESSAGE;
        errorLog = ErrorMessage.UNDEFINED_LOG;
    }
    LogController.logWarning(errorLog);
    return errorMessage;
  }

  static void singOutErrorHandling(FirebaseAuthException error) {
    String errorLog;

    switch (error.code) {
      case "invalid-user-token":
        errorLog = SignOutError.userInvalidError.message;
        break;
      case "user-token-expired":
        errorLog = SignOutError.userExpiredError.message;
        break;
      case "null-user":
        errorLog = SignOutError.userNotFoundError.message;
        break;
      case "tenant-id-mismatch":
        errorLog = SignOutError.userUnmatchError.message;
        break;
      default:
        errorLog = ErrorMessage.UNDEFINED_LOG;
    }

    LogController.logWarning(errorLog);
  }
}
