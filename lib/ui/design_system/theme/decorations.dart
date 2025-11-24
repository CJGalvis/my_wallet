import 'package:flutter/material.dart';

import 'shadows.dart';

class Decorations {
  static BoxDecoration cardsDecorations(
    BuildContext context,
    bool isDark,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color:
          isDark ? Theme.of(context).primaryColorDark : Colors.white,
      boxShadow: isDark
          ? null
          : Shadows.cardLightShadow(),
    );
  }

  static BoxDecoration pocketBackgroundDecorations(bool isDark) {
    return BoxDecoration(
      color: isDark
          ? Colors.blueGrey.shade900
          : Colors.indigoAccent.shade200,
    );
  }
}
