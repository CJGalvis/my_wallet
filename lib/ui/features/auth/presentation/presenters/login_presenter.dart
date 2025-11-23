import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../../../../../domain/models/user_auth_model.dart';
import '../args/login_args.dart';
import '../providers/login_provider.dart';

part 'login_presenter.g.dart';

class LoginPresenter {
  final LoginArgs _args;
  final LoginNotifier _loginNotifier;
  
  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  LoginPresenter(this._loginNotifier, this._args);

  Future<void> signIn() async {
    _loginNotifier.showLoading();

    final (ErrorItem?, UserAuth?) response =
        await _args.config.authUseCase.signIn(_loginNotifier.login);

    final ErrorItem? error = response.$1;
    final UserAuth? success = response.$2;

    if (success != null) {
      _loginNotifier.loginSuccess(success);
    }

    if (error != null) {
      _loginNotifier.showError(error.toString());
    }

    _loginNotifier.hideLoading();
  }
}

@riverpod
LoginPresenter loginPresenter(Ref ref, LoginArgs args) {
  final loginNotifier = ref.read(loginProvider.notifier);
  return LoginPresenter(loginNotifier, args);
}
