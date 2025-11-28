import 'package:my_wallet/ui/features/home/presentation/providers/pockets_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

@riverpod
double balance(Ref ref) {
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
      });
}
