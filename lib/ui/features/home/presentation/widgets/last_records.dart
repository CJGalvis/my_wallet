import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../design_system/design_system.dart';
import '../providers/last_records_provider.dart';
import 'widgets.dart';

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
                itemBuilder: (BuildContext context, int index) {
                  return ItemRecord(record: lastRecords[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
