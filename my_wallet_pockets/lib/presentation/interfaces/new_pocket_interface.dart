import 'package:my_wallet_core/my_wallet_core.dart';

abstract class NewPocketInterface { 
  void showLoading();
  void hideLoading();
  void showError(ErrorItem message);
  void createdSuccess();
}