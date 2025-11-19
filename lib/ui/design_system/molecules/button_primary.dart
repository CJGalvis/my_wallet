import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
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
      color: Colors.indigo,
      onPressed: callback,
      child: SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: labelButtonSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
