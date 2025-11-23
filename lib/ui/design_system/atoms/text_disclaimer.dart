import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class TextDisclaimer extends StatelessWidget {
  const TextDisclaimer({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSafe),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
