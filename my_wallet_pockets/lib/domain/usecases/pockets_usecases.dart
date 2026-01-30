


import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

import '../gateways/pockets_gateway.dart';

class PocketsUseCase {
  final PocketsGateway _newPocketGateway;

  PocketsUseCase(this._newPocketGateway);

  Future<(ErrorItem?, Pocket?)> createPocket(Pocket loginEntity) {
    return _newPocketGateway.createPocket(loginEntity);
  }

  Future<(ErrorItem?, List<Pocket>?)> getPockets() {
    return _newPocketGateway.getPockets();
  }
}
