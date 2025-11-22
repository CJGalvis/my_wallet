import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../../../../../domain/models/user_auth_model.dart';
import '../args/wellcome_args.dart';
import '../providers/wellcome_provider.dart';

part 'wellcome_presenter.g.dart';

class WellcomePresenter {
  final WellcomeArgs _args;
  final WellcomeNotifier _wellcomeNotifier;

  WellcomePresenter(this._wellcomeNotifier, this._args);

  Future<void> signWithGoogle() async {
    _wellcomeNotifier.showLoading();

    final (ErrorItem?, UserAuth?) response =
        await _args.config.authUseCase.signWithGoogle();

    final ErrorItem? error = response.$1;
    final UserAuth? res = response.$2;

    if (res != null) {
      _wellcomeNotifier.signSuccess();
    }

    if (error != null) {
      _wellcomeNotifier.showError(error.message);
    }

    _wellcomeNotifier.hideLoading();
  }
}

@riverpod
WellcomePresenter wellcomePresenter(Ref ref, WellcomeArgs args) {
  final wellcomeNotifier = ref.read(wellcomeProvider.notifier);
  return WellcomePresenter(wellcomeNotifier, args);
}