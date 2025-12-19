import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_home/my_wallet_home.dart';
import 'package:user_session_manager/user_session_manager.dart';

import '../../../firebase/cloud_firestore_service.dart';

class PocketsApi extends PocketsGateway {
  final CloudFirestoreService _cloudFirestore;
  final SessionManager _sessionManager;

  PocketsApi({
    CloudFirestoreService? cloudFirestore,
    SessionManager? session,
  })  : _cloudFirestore = cloudFirestore ?? CloudFirestoreService(),
        _sessionManager = session ?? SessionManager();

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
    try {
      final session = await _sessionManager.getUserSession();

      final newData = pocket.copyWith(owner: session?['email']);

      final data =
          await _cloudFirestore.saveNewPocket(newData.toMap());

      final Pocket newPocket = Pocket.fromMap(data);

      return Future.value((null, newPocket));
    } catch (e) {
      return Future.value((
        ErrorItem(
          code: 004,
          message: 'Error al intentar crear el nuevo bolsillo',
          description: '',
        ),
        null
      ));
    }
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() async {
    try {
      final session = await _sessionManager.getUserSession();

      final data =
          await _cloudFirestore.queryPockets(session?['email']);

      final List<Pocket> pockets =
          data.map((map) => Pocket.fromMap(map)).toList();

      return Future.value((null, pockets));
    } catch (e) {
      return Future.value((
        ErrorItem(
          code: 004,
          message: 'Error al intentar cargar los bolsillos',
          description: '',
        ),
        null
      ));
    }
  }
}
