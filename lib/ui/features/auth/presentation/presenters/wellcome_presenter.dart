import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/models/error_item.dart';
import '../args/wellcome_args.dart';
import '../providers/wellcome_interface_notifier.dart';

class WellcomePresenter {
  final WellcomeArgs _args;
  final WellcomeInterfaceNotifier _interface;

  WellcomePresenter(this._interface, this._args);

  Future<void> signWithGoogle() async {
    _interface.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signWithGoogle();

    final ErrorItem? error = response.$1;
    final bool res = response.$2;

    if (res) {
      _interface.signSuccess();
    }

    if (error != null) {
      _interface.showError(error.message);
    }

    _interface.hideLoading();
  }
}

final wellcomePresenterProvider =
    Provider.family<WellcomePresenter, WellcomeArgs>(
  (ref, args) => WellcomePresenter(
    ref.read(wellcomeInterfaceProvider.notifier),
    args,
  ),
);
