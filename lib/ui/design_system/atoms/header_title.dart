import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: headerTitleSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
