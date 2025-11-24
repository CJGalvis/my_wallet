import 'package:my_wallet/ui/features/home/domain/models/pocket_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/pocket_model.dart';

part 'pockets_provider.g.dart';

@Riverpod(keepAlive: true)
class PocketNotifier extends _$PocketNotifier {
  @override
  List<Pocket> build() {
    return [
      Pocket(
        id: Uuid().v4(),
        type: PocketType.initial(),
        name: 'Mi banco',
        balance: 0,
      ),
    ];
  }
}
