import 'package:flutter/material.dart';

import '../design_system.dart';

class TitleFeed extends StatelessWidget {
  const TitleFeed({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSizeTitle,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
    );
  }
}
