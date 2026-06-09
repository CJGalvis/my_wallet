import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

final incomesProvider = Provider<double>((ref) {
  final records = ref.watch(recordsProvider);

  return records.when(
    loading: () => 0,
    error: (error, _) => 0,
    data: (items) {
      if (items.isEmpty) {
        return 0;
      } else {
        final balance = items
            .where((a) => a.type == SummaryType.incomes)
            .map((p) => p.value)
            .reduce((a, b) => a + b);

        return balance;
      }
    },
  );
});
