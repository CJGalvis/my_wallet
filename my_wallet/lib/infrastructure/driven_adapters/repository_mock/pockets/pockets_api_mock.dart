import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/my_wallet_pockets.dart';

import '../../../mocks/mocks_response.dart';

class PocketsApiMock extends PocketsGateway {
  final SessionNotifier _sessionNotifier;

  PocketsApiMock({
    required SessionNotifier sessionNotifier,
  }) : _sessionNotifier = sessionNotifier;

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
    await Future.delayed(Duration(seconds: 3));

    final newPocket = pocket.copyWith(
      id: DateTime.timestamp().toString(),
    );
    
    return Future.value((null, newPocket));
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() async {
    await Future.delayed(Duration(seconds: 2));

    final user = _sessionNotifier.getUser();

    final (ErrorItem?, List<Map<String, dynamic>>?) data =
        await MocksResponse.getPocketsUser(user?.email ?? '');

    if (data.$2 != null) {
      final List<Pocket> pockets =
          data.$2!.map((map) => Pocket.fromMap(map)).toList();

      return Future.value((null, pockets));
    }

    return Future.value((data.$1, null));
  }
}
