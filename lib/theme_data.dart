import 'package:flutter/material.dart';

class Themes {
  static const kColorPrimary = Color(0xFF8338EC);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: kColorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
    colorScheme: ColorScheme.fromSeed(seedColor: kColorPrimary),
  );
}
