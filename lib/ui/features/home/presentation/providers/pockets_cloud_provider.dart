import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/pocket_model.dart';

part 'pockets_cloud_provider.g.dart';

@riverpod
class PocketsCloud extends _$PocketsCloud {
  @override
  AsyncValue<List<Pocket>> build() {
    return AsyncValue.loading();
  }

  Future<void> addPocket(Pocket pocket) async {
    final currentValue = state.value ?? [];
    state = AsyncValue.data([...currentValue, pocket]);
  }

  Future<void> setData(List<Pocket> data) async {
    state = AsyncValue.data(data);
  }

  void setError(Object e, StackTrace st) {
    state = AsyncValue.error(e, st);
  }

  void setLoading() {
    state = const AsyncValue.loading();
  }
}
