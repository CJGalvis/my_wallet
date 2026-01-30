import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

class PocketsContainer extends ConsumerWidget {
  final Widget child;

  const PocketsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.read(themeProvider.notifier).isDark(context);

    return Container(
      decoration: Decorations.pocketBackgroundDecorations(isDark),
      width: double.infinity,
      height: 120,
      child: child,
    );
  }
}
