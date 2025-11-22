import 'package:flutter/material.dart';

class AuthTheme {
  static BoxDecoration getBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.indigo,
          Colors.black,
        ],
      ),
    );
  }
}
