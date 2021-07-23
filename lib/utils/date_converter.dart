import 'package:intl/intl.dart';

class DateConverter{
  static String convertDate(String formattedString){
    DateTime dateTime = DateTime.parse(formattedString);
    String dateTimeFormatted = DateFormat('EEEE, dd-MM-yy, HH:mm').format(dateTime);
    return '$dateTimeFormatted';
  }
}