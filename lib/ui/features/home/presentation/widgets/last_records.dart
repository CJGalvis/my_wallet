import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/models/last_record.dart';
import '../../domain/models/summary_type.dart';
import '../helpers/format_helper.dart';
import '../providers/last_records_provider.dart';

class LastRecords extends ConsumerWidget {
  final String title;

  const LastRecords({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRecords = ref.watch(lastRecordsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: Decorations.cardsDecorations(),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFeed(title: title),
              Divider(color: primaryTextColor),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lastRecords.length,
                itemBuilder: (BuildContext context, int index) =>
                    _ItemRecord(
                  record: lastRecords[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemRecord extends StatelessWidget {
  final LastRecord record;

  const _ItemRecord({required this.record});

  @override
  Widget build(BuildContext context) {
    final isIncome = record.type == SummaryType.incomes;

    final color = isIncome ? Colors.green : Colors.redAccent;

    final symbol = isIncome ? '+' : '-';

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          record.icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        record.category,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryTextColor,
        ),
      ),
      subtitle: Text(
        record.pocket,
        style: TextStyle(
          color: primaryTextColor,
        ),
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
              style: TextStyle(
                color: primaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
