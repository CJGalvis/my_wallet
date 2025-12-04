import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part 'balance_provider.g.dart';

@riverpod
double balance(Ref ref) {
  final pockets = ref.watch(pocketsCloudProvider);
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
