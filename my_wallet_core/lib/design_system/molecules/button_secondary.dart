import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tokens/tokens.dart';

class ButtonSecondary extends ConsumerWidget {
  const ButtonSecondary({
    super.key,
    required this.callback,
    required this.label,
  });

  final VoidCallback callback;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusCircular),
      ),
      color: Colors.white70,
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
