import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/balance_provider.dart';

import '../../../../../design_system/molecules/molecules.dart';
import '../../helpers/format_helper.dart';

class Balance extends ConsumerWidget {
  const Balance({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withValues(alpha: 0.3),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFeed(title: label),
              Divider(
                color: Colors.white70,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '\$ ${FormatHelper.currency(balance)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
