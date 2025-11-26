import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';

import '../../../../../domain/models/error_item.dart';

abstract class PocketsGateway {
  Future<(ErrorItem?, bool)> createPocket(Pocket pocket);
}
