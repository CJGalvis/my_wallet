import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    super.key,
    required this.callback,
    required this.label,
  });

  final VoidCallback callback;
  final String label;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusCircular),
      ),
      color: Colors.white,
      onPressed: callback,
      child: SizedBox(
        height: buttonHeight,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: labelButtonSize),
          ),
        ),
      ),
    );
  }
}
