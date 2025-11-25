import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/pocket_model.dart';

part 'pockets_provider.g.dart';

@Riverpod(keepAlive: true)
class PocketNotifier extends _$PocketNotifier {
  @override
  List<Pocket> build() {
    return [];
  }

  void addNewPocket(Pocket data) {
    state = [
      ...state,
      data,
    ];
  }
}
