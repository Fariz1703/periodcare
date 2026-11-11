import 'package:intl/intl.dart';

String dateMonth(DateTime date) {
  return DateFormat('d MMM', 'id_ID').format(date);
}