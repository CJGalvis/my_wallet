import 'package:my_wallet/ui/features/home/domain/gateways/pockets_gateway.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';

import '../../../../../domain/models/error_item.dart';

class PocketsUseCase {
  final PocketsGateway _newPocketGateway;

  PocketsUseCase(this._newPocketGateway);

  Future<(ErrorItem?, Pocket?)> createPocket(Pocket loginEntity) {
    return _newPocketGateway.createPocket(loginEntity);
  }

  Future<(ErrorItem?, List<Pocket>?)> getPockets(String owner) {
    return _newPocketGateway.getPockets(owner);
  }
}
