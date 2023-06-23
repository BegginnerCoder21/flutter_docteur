import 'package:intl/intl.dart';

class DateConvertie {
  static getDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static getDay(int day) {
    switch (day) {
      case 1:
        return 'Lundi';
      case 2:
        return 'Mardi';
      case 3:
        return 'Mercredi';
      case 4:
        return 'Jeudi';
      case 5:
        return 'Vendredi';
      case 6:
        return 'Samedi';
      case 7:
        return 'Dimanche';
      default:
        return 'Dimanche';
    }
  }

  static getTime(int time) {
    switch (time) {
      case 0:
        return '9:00';
      case 1:
        return '10:00';
      case 2:
        return '11:00';
      case 3:
        return '12:00';
      case 4:
        return '13:00';
      case 5:
        return '14:00';
      case 6:
        return '15:00';
      case 7:
        return '16:00';
      default:
      return '9:00';
    }
  }
}
