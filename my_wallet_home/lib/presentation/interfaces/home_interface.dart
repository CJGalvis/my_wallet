
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

abstract class HomeInterface {
  void showError(ErrorItem message);
  void uploadedData(List<Pocket> pockets);
}
