import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_pockets/presentation/providers/providers.dart';

final balanceProvider = Provider<double>((ref) {
  final pockets = ref.watch(pocketsProvider);
  return pockets.when(
    loading: () => 0,
    error: (error, _) => 0,
    data: (items) {
      if (items.isEmpty) {
        return 0;
      } else {
        return items.map((p) => p.balance).reduce((a, b) => a + b);
      }
    },
  );
});
