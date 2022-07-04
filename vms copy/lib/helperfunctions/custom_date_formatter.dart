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

  static String getTimeStringFromDateTime(DateTime time) {
    String pad = "";
    String pad2 = "";
    if (time.hour < 9) {
      pad += "0";
    }
    if (time.minute < 9) {
      pad2 += "0";
    }
    return "$pad${time.hour}:$pad2${time.minute}";
  }

  static DateTime combineDateAndTime(DateTime date, String time) {
    String pad = "";
    String pad2 = "";

    if (date.month < 9) {
      pad += "0";
    }
    if (date.day < 9) {
      pad2 += "0";
    }
    String parsableString =
        "${date.year}-$pad${date.month}-$pad2${date.day} $time";
    return (DateTime.parse(parsableString));
  }

  static DateTime getDateTimeFromTimeString(DateTime date, String time) {
    String pad = "";
    String pad2 = "";

    if (date.month < 9) {
      pad += "0";
    }
    if (date.day < 9) {
      pad2 += "0";
    }
    String parsableString =
        "${date.year}-$pad${date.month}-$pad2${date.day} $time";
    return (DateTime.parse(parsableString));
  }

  static String combineTime(String startTime, String endTime) {
    return startTime + " - " + endTime;
  }
}
