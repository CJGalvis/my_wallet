import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  bool isDark(BuildContext context) {
    return state == ThemeMode.dark ||
        (state == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) ==
                Brightness.dark);
  }

  void setTheme(ThemeMode mode) {
    state = mode;
  }
}
