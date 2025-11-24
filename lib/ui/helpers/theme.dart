import 'package:flutter/material.dart';

class AuthTheme {
  static BoxDecoration getBackground(
      BuildContext context, bool isDark) {
    return BoxDecoration(
        color: isDark
            ? Theme.of(context).primaryColorDark
            : Colors.indigo);
  }
}
