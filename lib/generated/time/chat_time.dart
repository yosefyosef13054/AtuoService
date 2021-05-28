import 'package:autoservice/app/shared/data/detect_locale.dart';
import 'package:intl/intl.dart';

class ChatTime {
  static convertToReadableDate(dateTime) {
    var date = DateTime.parse(dateTime);
    return DetectLocale.detectLocale()
        ? DateFormat('EEEE').format(date)
        : convertDayNameEnToAr(DateFormat('EEEE').format(date));
  }

  static convertDayNameEnToAr(dayName) {
    switch (dayName) {
      case "Saturday":
        return "السبت";
      case "Sunday":
        return "الأحد";
      case "Monday":
        return "الإثنين";
      case "Tuesday":
        return "الثلاثاء";
      case "Wednesday":
        return "الأربعاء";
      case "Thursday":
        return "الخميس";
      case "Friday":
        return "الجمعة";
    }
  }

  static showMessageTime(dateTime) {
    DateTime date = DateTime.parse(dateTime).add(Duration(hours: 2));
    String hourType = DateFormat('a').format(date);
    String time = hourType == "AM" ? 'ص' : 'م';

    return DetectLocale.detectLocale()
        ? DateFormat('h:mma').format(date)
        : DateFormat('h:mm').format(date) + "" + time;
  }
}
