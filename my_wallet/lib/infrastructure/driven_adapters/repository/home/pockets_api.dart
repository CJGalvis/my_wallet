import 'package:my_wallet/infrastructure/mocks/mocks_response.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/gateways/pockets_gateway.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

class PocketsApi extends PocketsGateway {
  final SessionNotifier _sessionNotifier;

  PocketsApi({
    required SessionNotifier sessionNotifier,
  }) : _sessionNotifier = sessionNotifier;

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) {
    throw UnimplementedError();
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() async {
    final session = _sessionNotifier.getUser();

    final (ErrorItem?, List<Map<String, dynamic>>?) data =
        await MocksResponse.getPocketsUser(session?.email ?? '');

    if (data.$2 != null) {
      final List<Pocket> pockets =
          data.$2!.map((map) => Pocket.fromMap(map)).toList();

      return Future.value((null, pockets));
    }

    return Future.value((data.$1, null));
  }
}
