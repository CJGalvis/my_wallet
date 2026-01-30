import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_home/my_wallet_home.dart';
import 'package:user_session_manager/user_session_manager.dart';

import '../../../mocks/mocks_response.dart';

class PocketsApiMock extends PocketsGateway {
  final SessionManager _sessionManager;

  PocketsApiMock({
    SessionManager? session,
  }) : _sessionManager = session ?? SessionManager();

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value((null, null));
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() async {
     await Future.delayed(Duration(seconds: 2));
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
