import 'package:intl/intl.dart';

class DateFormatter {
  static final _dateFormat = DateFormat.yMMMd().add_Hm();

  static String formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return _dateFormat.format(date);
  }

  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }
}
