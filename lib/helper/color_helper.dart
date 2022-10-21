import 'package:flutter/material.dart';

class ColorHelper {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static Color gray() {
    return colorFromHex("#A9A9A9");
  }

  static Color blue() {
    return Colors.blue;
  }
}
