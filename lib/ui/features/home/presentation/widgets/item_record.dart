import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';
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
      leading: record.icon != null
          ? CircleAvatar(
              backgroundColor: color,
              child: Icon(
                record.icon,
                color: Colors.white,
              ),
            )
          : null,
      title: Text(
        record.category,
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
                fontSize: fontSizeSubtitle,
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
