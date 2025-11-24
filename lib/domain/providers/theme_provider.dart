import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeApp extends _$ThemeApp {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  bool isDark(BuildContext context) {
    return state == ThemeMode.dark ||
        (state == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness ==
                Brightness.dark);
  }

  void setTheme(ThemeMode mode) {
    state = mode;
  }
}
