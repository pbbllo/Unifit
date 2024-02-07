import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:unifit/enums/date_format_enum.dart';
import 'package:unifit/utils/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unifit/utils/extensions.dart';

class Utils {
  /// Utilities for the application.

  static String timestampToString(
      {required Timestamp timestamp,
      DateFormatEnum format = DateFormatEnum.inFull,
      String separator = '/',
      String locale = APP_LOCALE}) {
    /// Receives a [timestamp] and converts it to a String in the preferred
    /// [format] according to the provided Intl [locale].
    ///
    /// If a [locale] is not provided,the default locale will be used.
    /// A custom [separator] can be provided as well. Defaults to '/'.
    DateTime dateTime = timestamp.toDate();

    initializeDateFormatting(locale);

    switch (format) {
      case DateFormatEnum.ddmm:
        return DateFormat('dd/MM', locale)
            .format(dateTime)
            .replaceAll('/', separator);
      case DateFormatEnum.ddmmyy:
        return DateFormat('dd/MM/yy', locale)
            .format(dateTime)
            .replaceAll('/', separator);
      default:
        return DateFormat('EEE, dd/MM/yy', locale)
            .format(dateTime)
            .replaceAll('/', separator)
            .capitalize();
    }
  }
}
