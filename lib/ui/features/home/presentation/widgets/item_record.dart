import 'package:flutter/material.dart';

import '../../domain/models/record_item.dart';
import '../../domain/models/summary_type.dart';
import '../helpers/format_helper.dart';

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
          record.category.icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        record.category.name,
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
              style: TextStyle(
                fontSize: 14,
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
