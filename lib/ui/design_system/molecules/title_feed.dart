import 'package:flutter/material.dart';

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
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
