import 'package:my_wallet/ui/features/home/presentation/providers/pockets_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

@riverpod
double balance(Ref ref) {
  final pockets = ref.watch(pocketProvider);
  final balance =
      pockets.map((p) => p.balance).reduce((a, b) => a + b);
  return balance;
}
