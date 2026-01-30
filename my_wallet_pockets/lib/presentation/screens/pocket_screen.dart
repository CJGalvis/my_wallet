import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

class PocketScreen extends ConsumerStatefulWidget {
  static const String routeName = '/pocket';
  final Pocket pocket;

  const PocketScreen({super.key, required this.pocket});

  @override
  ConsumerState<PocketScreen> createState() => _PocketScreenState();
}

class _PocketScreenState extends ConsumerState<PocketScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = ref.read(themeProvider.notifier).isDark(context);

    final records = ref.watch(
      recordsByPocketProvider(widget.pocket.name),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.pocket.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CurrentBalance(isDark: isDark, widget: widget),
            const SizedBox(height: 15),
            _RecordsByPocket(isDark: isDark, records: records),
          ],
        ),
      ),
    );
  }
}

class _RecordsByPocket extends StatelessWidget {
  const _RecordsByPocket({
    required this.isDark,
    required this.records,
  });

  final bool isDark;
  final List<RecordItem> records;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark
            ? Theme.of(context).primaryColorDark
            : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleFeed(title: 'Registros del bolsillo'),
            Divider(),
            records.isEmpty
                ? Center(
                    child: Text('No hay registros en este bolsillo'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final item = records[index];

                      return ItemRecord(
                        record: RecordItem(
                          tag: item.tag,
                          pocket: item.pocket,
                          value: item.value,
                          date: item.date,
                          type: item.type,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class _CurrentBalance extends StatelessWidget {
  const _CurrentBalance({required this.isDark, required this.widget});

  final bool isDark;
  final PocketScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark
            ? Theme.of(context).primaryColorDark
            : Colors.white,
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Saldo actual',
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      '\$ ${FormatHelper.currency(widget.pocket.balance)}',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
