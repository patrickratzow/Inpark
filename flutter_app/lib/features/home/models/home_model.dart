import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  String greetingText({DateTime? dateTime}) {
    dateTime ??= DateTime.now();
    if (dateTime.hour >= 3 && dateTime.hour < 11) {
      return 'God Morgen';
    } else if (dateTime.hour >= 11 && dateTime.hour < 14) {
      return 'God Middag';
    } else if (dateTime.hour >= 14 && dateTime.hour < 17) {
      return 'God Eftermiddag';
    } else if (dateTime.hour >= 17 || dateTime.hour < 3) {
      return 'God Aften';
    }
    return 'Goddag';
  }
}
