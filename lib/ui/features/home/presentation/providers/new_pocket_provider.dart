import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_pocket_provider.g.dart';

@riverpod
class NewPocketNotifier extends _$NewPocketNotifier {
  @override
  Pocket build() {
    return Pocket.initial();
  }

  void setType(PocketType value) =>
      state = state.copyWith(type: value);

  void setName(String value) => state = state.copyWith(name: value);

  void setBalance(double value) =>
      state = state.copyWith(balance: value);
}
