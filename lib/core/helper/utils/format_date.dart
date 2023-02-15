import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd/MMM/yy').format(date); // H:mm
}
