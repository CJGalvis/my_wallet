import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_pockets/my_wallet_pockets.dart';

import '../interfaces/pockets_interface.dart';

class PocketsPresenter {
  final PocketsConfig _config;
  final PocketsInterface _interface;

  PocketsPresenter(this._interface, this._config);

  Future<void> getPockets() async {
    final (ErrorItem?, List<Pocket>?) response = await _config
        .pocketsUseCase
        .getPockets();

    final ErrorItem? error = response.$1;
    final List<Pocket>? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      _interface.updateData(data);
    }
  }
}
