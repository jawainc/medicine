import 'package:date_format/date_format.dart';
class Helpers {

  String getCurrentDayName() {
    return formatDate(DateTime.now(), [DD]);
  }

  String getCurrentDate() {
    return formatDate(DateTime.now(), [MM, ' ', dd]);
  }
}

final helpers = Helpers();