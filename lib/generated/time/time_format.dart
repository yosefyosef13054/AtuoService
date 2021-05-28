import 'package:intl/intl.dart';

class TimeFormat{

  static formatTime(dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

}