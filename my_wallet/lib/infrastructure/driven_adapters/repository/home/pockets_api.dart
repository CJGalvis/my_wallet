import 'package:my_wallet/infrastructure/mocks/mocks_response.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/gateways/pockets_gateway.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'package:user_session_manager/user_session_manager.dart';

class PocketsApi extends PocketsGateway {
  final SessionManager _sessionManager;

  PocketsApi({
    SessionManager? session,
  }) : _sessionManager = session ?? SessionManager();

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) {
    throw UnimplementedError();
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() async {
    final session = await _sessionManager.getUserSession();

    final (ErrorItem?, List<Map<String, dynamic>>?) data =
        await MocksResponse.getPocketsUser(session?['email']);

    if (data.$2 != null) {
      final List<Pocket> pockets =
          data.$2!.map((map) => Pocket.fromMap(map)).toList();

      return Future.value((null, pockets));
    }

    return Future.value((data.$1, null));
  }
}
