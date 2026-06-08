import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

abstract class PocketsInterface {
  void showError(ErrorItem message);
  void updateData(List<Pocket> pockets);
}
