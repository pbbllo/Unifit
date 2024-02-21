import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Logging {
  /// Logging utils.
  static final _instance = Logger();

  Logging._();
  static void logWarning(String message) => _instance.w(
      "${DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now())}: $message");
  static void logInfo(String message) => _instance.i(
      "${DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now())}: $message");
  static void logError(String message, [StackTrace? stackTrace]) => _instance.e(
      "${DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now())}: $message\n"
      "StackTrace: ${stackTrace.toString()}");
}
