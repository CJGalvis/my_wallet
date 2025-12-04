import '../../../../domain/models/error_item.dart';
import '../../../../ui/features/home/domain/gateways/pockets_gateway.dart';
import '../../../../ui/features/home/domain/models/pocket_model.dart';
import '../../../firebase/cloud_firestore_service.dart';

class PocketsApi extends PocketsGateway {
  final CloudFirestoreService _cloudFirestore;

  PocketsApi({
    CloudFirestoreService? cloudFirestore,
  }) : _cloudFirestore = cloudFirestore ?? CloudFirestoreService();

  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
    try {
      final data =
          await _cloudFirestore.saveNewPocket(pocket.toMap());

      final Pocket newPocket = Pocket.fromMap(data);

      return Future.value((null, newPocket));
    } catch (e) {
      return Future.value((
        ErrorItem(
          code: 004,
          message: 'Error al intentar crear el nuevo bolsillo',
        ),
        null
      ));
    }
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets(String owner) async {
    try {
      final data = await _cloudFirestore.queryPockets(owner);

      final List<Pocket> pockets =
          data.map((map) => Pocket.fromMap(map)).toList();

      return Future.value((null, pockets));
    } catch (e) {
      return Future.value((
        ErrorItem(
          code: 004,
          message: 'Error al intentar cargar los bolsillos',
        ),
        null
      ));
    }
  }
}
