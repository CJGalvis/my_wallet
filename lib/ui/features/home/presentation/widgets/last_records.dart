import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/theme_provider.dart';
import '../../../../design_system/design_system.dart';
import '../providers/last_records_provider.dart';
import 'widgets.dart';

class LastRecords extends ConsumerWidget {
  final String title;
  final VoidCallback onPressedShowMore;

  const LastRecords({
    super.key,
    required this.title,
    required this.onPressedShowMore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRecords = ref.watch(lastRecordsProvider);
    final isDark =
        ref.watch(themeAppProvider.notifier).isDark(context);
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
              TitleFeed(title: title),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lastRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemRecord(record: lastRecords[index]);
                },
              ),
              //ToDo: arreglar por que no se ve
              ButtonText(
                callback: onPressedShowMore,
                label: 'Ver más',
              )
            ],
          ),
        ),
      ),
    );
  }
}
