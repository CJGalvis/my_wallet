import 'package:flutter/material.dart';

class AppLightTheme {
  static ThemeData theme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        textTheme: __textTheme(),
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        appBarTheme: _appBarTheme(),
        floatingActionButtonTheme: _floatingButtonTheme(),
        primaryColorLight: Colors.indigo,
        highlightColor: Colors.indigo,
        hintColor: Colors.indigo.shade400,
      );

  static TextTheme __textTheme() {
    return TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.blueGrey,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade500,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade500,
      ),
      labelSmall: TextStyle(color: Colors.blueGrey, fontSize: 12),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade500,
      ),
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade500,
      ),
    );
  }

  static FloatingActionButtonThemeData _floatingButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.indigoAccent.shade200,
      foregroundColor: Colors.white,
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigoAccent.shade200,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
