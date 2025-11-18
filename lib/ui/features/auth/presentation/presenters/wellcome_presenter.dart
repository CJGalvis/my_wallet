import '../../../../../domain/models/error_item.dart';
import '../args/wellcome_args.dart';
import '../interface/wellcome_interface.dart';

class WellcomePresenter {
  final WellcomeArgs _args;
  final WelcomeInterface _interface;

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
      _interface.showErrorMessage(error.message);
    }

    _interface.hideLoading();
  }
}
