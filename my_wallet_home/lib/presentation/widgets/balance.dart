import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/helpers/format_helper.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import '../providers/balance_provider.dart';

class Balance extends ConsumerWidget {
  const Balance({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    
    final isDark =
        ref.read(themeProvider.notifier).isDark(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: Decorations.cardsDecorations(context, isDark),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFeed(title: label),
              Divider(),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '\$ ${FormatHelper.currency(balance)}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
