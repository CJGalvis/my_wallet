import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/models/summary_type.dart';
import '../helpers/format_helper.dart';

class SummaryCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: Decorations.cardsDecorations(),
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
              _ButtonSummary(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonSummary extends StatelessWidget {
  const _ButtonSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: primaryTextColor),
      ),
      padding: EdgeInsets.all(5),
      child: Icon(
        Icons.keyboard_arrow_right_rounded,
        color: primaryTextColor,
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
