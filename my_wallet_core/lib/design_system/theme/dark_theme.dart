import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData theme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blueGrey.shade900,
        textTheme: __textTheme(),
        scaffoldBackgroundColor: Colors.blueGrey.shade900,
        appBarTheme: _appBarTheme(),
        floatingActionButtonTheme: _floatingButtonTheme(),
        primaryColorDark: Colors.blueGrey.shade800,
        highlightColor: Colors.white70,
        hintColor: Colors.white54,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.blueGrey.shade900,
        ),
        cardTheme: CardThemeData(
          color: Colors.white54,
        ),
      );

  static TextTheme __textTheme() {
    return TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.blueGrey.shade100,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade200,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade300,
      ),
      labelSmall: TextStyle(color: Colors.blueGrey, fontSize: 12),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade200,
      ),
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey.shade200,
      ),
    );
  }

  static FloatingActionButtonThemeData _floatingButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey.shade700,
      foregroundColor: Colors.white,
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey.shade900,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
