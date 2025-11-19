import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    super.key,
    required this.callback,
    required this.label,
  });

  final String label;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: labelButtontextSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
