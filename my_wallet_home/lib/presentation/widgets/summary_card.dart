import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

class SummaryCard extends ConsumerWidget {
  const SummaryCard({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    required this.value,
    required this.callback,
  });

  final SummaryType type;
  final String title;
  final String description;
  final double value;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeProvider.notifier).isDark(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: Decorations.cardsDecorations(context, isDark),
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              _IconSummary(type: type),
              _TitleSummary(title: title),
              _BalanceSummary(value: value, description: description),
              const SizedBox(width: 15),
              _ButtonSummary(onPressed: callback),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonSummary extends StatelessWidget {
  const _ButtonSummary({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: primaryTextColor),
        ),
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: primaryTextColor,
        ),
      ),
    );
  }
}

class _BalanceSummary extends StatelessWidget {
  const _BalanceSummary({
    required this.value,
    required this.description,
  });

  final double value;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            '\$ ${FormatHelper.currency(value)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _TitleSummary extends StatelessWidget {
  const _TitleSummary({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class _IconSummary extends StatelessWidget {
  const _IconSummary({
    required this.type,
  });

  final SummaryType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: primaryTextColor),
      ),
      padding: EdgeInsets.all(5),
      child: type == SummaryType.incomes
          ? Icon(
              Icons.arrow_upward,
              color: Colors.green,
            )
          : Icon(
              Icons.arrow_downward,
              color: Colors.red,
            ),
    );
  }
}
