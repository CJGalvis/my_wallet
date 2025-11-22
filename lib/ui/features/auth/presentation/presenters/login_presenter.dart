import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../args/login_args.dart';
import '../providers/login_provider.dart';

part 'login_presenter.g.dart';

class LoginPresenter {
  final LoginArgs _args;
  final LoginUI _loginUIProvider;
  
  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  LoginPresenter(this._loginUIProvider, this._args);

  Future<void> signIn() async {
    _loginUIProvider.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signIn(_loginUIProvider.login);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _loginUIProvider.loginSuccess();
    }

    if (error != null) {
      _loginUIProvider.showError(error.toString());
    }

    _loginUIProvider.hideLoading();
  }
}

@riverpod
LoginPresenter loginPresenter(Ref ref, LoginArgs args) {
  final loginUI = ref.read(loginUIProvider.notifier);
  return LoginPresenter(loginUI, args);
}
