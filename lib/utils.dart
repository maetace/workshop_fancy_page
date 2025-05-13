import 'package:get/get.dart';
import 'package:intl/intl.dart';

String getDisplayDate(dynamic date, {String format = 'd MMMM yyyy HH:mm:ss'}) {
  if (date == null) {
    return '';
  }
  DateTime? utcDate;
  if (date.runtimeType == String) {
    utcDate = DateTime.tryParse(date);
  } else if (date.runtimeType == DateTime) {
    utcDate = date;
  }
  if (utcDate == null) {
    return '';
  }
  final localDate = utcDate.toLocal();
  return DateFormat(format, Get.locale?.languageCode).format(localDate);
}

String getDisplayNumber(num? number, {String format = '#,###'}) {
  if (number == null) {
    return NumberFormat(format, Get.locale?.languageCode).format(0);
  }
  return NumberFormat(format, Get.locale?.languageCode).format(number);
}

String getDisplayShortNumber(num? number) {
  if (number == null) {
    return '0';
  }
  if (number > 999 && number < 99999) {
    return '${(number / 1000).toStringAsFixed(0)}K';
  } else if (number > 99999 && number < 999999) {
    return '${(number / 1000).toStringAsFixed(0)}K';
  } else if (number > 999999 && number < 999999999) {
    return '${(number / 1000000).toStringAsFixed(0)}M';
  } else if (number > 999999999) {
    return '${(number / 1000000000).toStringAsFixed(0)}B';
  } else {
    return '$number';
  }
}
