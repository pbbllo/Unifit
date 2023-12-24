import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:unifit/enums/date_format_enum.dart';
import 'package:unifit/utils/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unifit/utils/extensions.dart';

class Utils {
  static String timestampToString(
      {required Timestamp timestamp,
      DateFormatEnum format = DateFormatEnum.inFull,
      String separator = '/',
      String locale = APP_LOCALE}) {
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
