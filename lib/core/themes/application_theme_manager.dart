import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'color_palette.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
 useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: BaseColorPalette.white,

    ),
  );
}
