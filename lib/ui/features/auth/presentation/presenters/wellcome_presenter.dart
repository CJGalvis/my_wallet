import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../args/wellcome_args.dart';
import '../providers/wellcome_ui_provider.dart';

part 'wellcome_presenter.g.dart';

class WellcomePresenter {
  final WellcomeArgs _args;
  final WellcomeUI _interface;

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

@riverpod
WellcomePresenter wellcomePresenter(Ref ref, WellcomeArgs args) {
  final wellcomeProvider = ref.read(wellcomeUIProvider.notifier);
  return WellcomePresenter(wellcomeProvider, args);
}