import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../infrastructure/local_storage/local_db.dart';
import '../../domain/models/pocket_model.dart';

part 'pockets_provider.g.dart';

@Riverpod(keepAlive: true)
class PocketsNotifier extends _$PocketsNotifier {
  @override
  Future<List<Pocket>> build() {
    return LocalDB.db.getPockets();
  }

  Future<void> addPocket(Pocket pocket) async {
    await LocalDB.db.newPocket(pocket);
    state = AsyncValue.data(await LocalDB.db.getPockets());
  }

  Future<void> updatePocket(Pocket pocket) async {
    await LocalDB.db.updatePocket(pocket);
    state = AsyncValue.data(await LocalDB.db.getPockets());
  }

  Future<void> deletePocket(int id) async {
    await LocalDB.db.deletePocket(id);
    state = AsyncValue.data(await LocalDB.db.getPockets());
  }
}
