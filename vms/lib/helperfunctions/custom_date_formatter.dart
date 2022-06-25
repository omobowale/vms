import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateFormatter {
  static String getFormattedTime(DateTime? dateTime) {
    if (dateTime != null) {
      DateFormat formatter = DateFormat('hh:mm a');
      String formatted = formatter.format(dateTime);
      return formatted;
    }
    return "";
  }

  static String getWeekDay(DateTime? dateTime) {
    if (dateTime != null) {
      DateFormat formatter = DateFormat('EEEE');
      String formatted = formatter.format(dateTime);
      return formatted.toUpperCase();
    }
    return "";
  }

  static String getFormatedDate(DateTime? dateTime) {
    if (dateTime != null) {
      DateFormat formatter = DateFormat('yMd');
      String formatted = formatter.format(dateTime);
      return formatted;
    }
    return "";
  }

  static String getFormattedDay(DateTime? dateTime) {
    print(dateTime.toString());
    if (dateTime != null) {
      DateFormat formatter = DateFormat('EEEE MMM dd, yyyy');
      String formatted = formatter.format(dateTime);
      return formatted.toUpperCase();
    }
    return "";
  }

  static DateTime getDateTimeFromTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  static String combineTime(String startTime, String endTime) {
    return startTime + " - " + endTime;
  }
}
