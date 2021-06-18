import 'package:intl/intl.dart';


abstract class U{

  static int getMonthFromDateString(String date){
    var dateTime= DateTime.parse(date);
    return dateTime.month;
  }

  static int getYearFromDateString(String date){
    var dateTime= DateTime.parse(date);
    return dateTime.year;
  }

  static String getDateString(int? date,int? month,int? year){
    var now = DateTime.now();
    var dateTime= DateFormat("yyyy-MM-dd").format(DateTime(year??now.year,month??now.month,date??1));
    return dateTime;
  }

  static String getDateStringMonthYear(int? date,int? month,int? year){
    var now = DateTime.now();
    var dateTime= DateFormat("MMMM,yyyy").format(DateTime(year??now.year,month??now.month,date??1));
    return dateTime;
  }


  static String getMonthNameFromDateString(String date){
    var month = getMonthFromDateString(date);
    switch(month){
      case DateTime.january: return "January";
      case DateTime.february: return "February";
      case DateTime.march: return "March";
      case DateTime.april: return "April";
      case DateTime.may: return "May";
      case DateTime.june: return "June";
      case DateTime.july: return "July";
      case DateTime.august: return "August";
      case DateTime.september: return "September";
      case DateTime.october: return "October";
      case DateTime.november: return "November";
      case DateTime.december: return "December";
    }
    return "";
  }
}