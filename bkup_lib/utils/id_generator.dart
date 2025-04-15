import '../constants/user_constants.dart';

class IdGenerator {
  static String generateWorkOrderNumber() {
    final now = DateTime.now();
    final date = "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";
    final time = "${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}";
    return '$currentUserPrefix-$date-$time';
  }
}
