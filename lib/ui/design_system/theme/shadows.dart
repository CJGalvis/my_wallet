import 'package:flutter/material.dart';

class Shadows {
  static List<BoxShadow> cardLightShadow() => [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: Offset(4, 8), // Shadow position
        ),
      ];

  static List<BoxShadow> cardDarkShadow() => [
        BoxShadow(
          color: Colors.grey.shade800,
          blurRadius: 4,
          offset: Offset(4, 8), // Shadow position
        ),
      ];
}
