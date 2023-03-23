import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#4F3CEC");

  static Color teal = HexColor.fromHex("#2AD2A1");

  static Color blueBackground = HexColor.fromHex("#F4F7FF");
  static Color kTextColor = Colors.black;
  static Color normalBorderColor = Colors.grey[400]!;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opactiy 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
