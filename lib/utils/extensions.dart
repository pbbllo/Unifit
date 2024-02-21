import 'package:sprintf/sprintf.dart';

extension StringExtension on String {
  /// Extension methods for strings.

  /// Capitalizes the first letter of the target string.
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// Interpolates a string with the provided [arguments].
  String format(var arguments) {
    return sprintf(this, arguments);
  }
}

extension ObjectExtension on Object? {
  /// Extension methods for [Object].

  /// Checks if an object is null
  bool isNull() => this == null;

  /// Checks if an object is not null
  bool isNotNull() => this != null;
}
