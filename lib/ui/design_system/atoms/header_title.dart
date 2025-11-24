import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/providers/providers.dart';
import '../tokens/tokens.dart';

class HeaderTitle extends ConsumerWidget {
  const HeaderTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);
        
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: headerTitleSize,
        fontWeight: FontWeight.bold,
        color:isDark ? Theme.of(context).highlightColor : Colors.white,
      ),
    );
  }
}
