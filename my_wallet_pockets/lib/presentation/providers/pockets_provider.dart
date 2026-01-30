import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

final pocketsProvider =
    NotifierProvider<PocketsNotifier, AsyncValue<List<Pocket>>>(
      PocketsNotifier.new,
    );

class PocketsNotifier extends Notifier<AsyncValue<List<Pocket>>> {
  @override
  AsyncValue<List<Pocket>> build() {
    return AsyncValue.loading();
  }

  Future<void> loadPockets(List<Pocket> data) async {
    try {
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> addPocket(Pocket pocket) async {
    final current = state.value ?? [];
    state = AsyncData([...current, pocket]);
  }
}
