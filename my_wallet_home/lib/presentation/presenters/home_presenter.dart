import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

import '../args/home_args.dart';
import '../interfaces/home_interface.dart';

class HomePresenter {
  final HomeArgs _args;
  final HomeInterface _interface;

  HomePresenter(this._interface, this._args);

  Future<void> getPockets() async {
    final (ErrorItem?, List<Pocket>?) response = await _args
        .pocketsconfig
        .usecases
        .getPockets();

    final ErrorItem? error = response.$1;
    final List<Pocket>? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      _interface.uploadedData(data);
    }
  }
}
