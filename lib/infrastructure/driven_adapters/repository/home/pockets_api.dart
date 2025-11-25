import '../../../../domain/models/error_item.dart';
import '../../../../ui/features/home/domain/gateways/pockets_gateway.dart';
import '../../../../ui/features/home/domain/models/pocket_model.dart';

class PocketsApi extends PocketsGateway {
  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) {
    throw UnimplementedError();
  }
}
