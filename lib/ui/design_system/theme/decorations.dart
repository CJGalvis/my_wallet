import 'package:flutter/material.dart';

import 'shadows.dart';

class Decorations {
  static BoxDecoration cardsDecorations() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: Shadows.cardLightShadow(),
    );
  }
}
