import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../tokens/tokens.dart';

class ButtonText extends ConsumerWidget {
  const ButtonText({
    super.key,
    required this.callback,
    required this.label,
  });

  final String label;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: callback,
      child: Text(
        label,
        style: TextStyle(
          fontSize: labelButtonTextSize,
          color: Colors.white70,
        ),
      ),
    );
  }
}
