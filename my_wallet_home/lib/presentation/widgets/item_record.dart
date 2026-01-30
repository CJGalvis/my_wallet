import 'package:flutter/material.dart';
import 'package:my_wallet_core/helpers/format_helper.dart';

import '../../domain/models/record_item.dart';
import '../../domain/models/summary_type.dart';

class ItemRecord extends StatelessWidget {
  final RecordItem record;

  const ItemRecord({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final isIncome = record.type == SummaryType.incomes;

    final color = isIncome ? Colors.green : Colors.redAccent;

    final symbol = isIncome ? '+' : '-';

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          isIncome
              ? Icons.call_received_outlined
              : Icons.call_made_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        record.tag,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        record.pocket,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$symbol \$ ${FormatHelper.currency(record.value)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color,
                  ),
            ),
            Text(
              FormatHelper.date(record.date),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
