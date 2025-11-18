import 'package:flutter/material.dart';

class MessageHelper {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    bool isError = false,
    Duration duration = const Duration(seconds: 4),
  }) {
    final color = isError ? Colors.red : Colors.green;
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
