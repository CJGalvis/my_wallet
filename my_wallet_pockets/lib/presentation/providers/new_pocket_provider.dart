import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';


final newPocketProvider = NotifierProvider<NewPocketNotifier, Pocket>(
  NewPocketNotifier.new,
);

class NewPocketNotifier extends Notifier<Pocket> {
  @override
  Pocket build() {
    return Pocket.initial();
  }

  void setType(String value) {
    state = state.copyWith(type: value);
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }

  void setBalance(double value) {
    state = state.copyWith(balance: value);
  }
}
