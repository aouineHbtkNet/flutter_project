import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color color = Colors.lightGreenAccent;
  Color getColor() {
    notifyListeners();
    return color;
  }
}
