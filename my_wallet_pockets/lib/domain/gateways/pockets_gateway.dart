


import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

abstract class PocketsGateway {
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket);
  Future<(ErrorItem?, List<Pocket>?)> getPockets();
}
