import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/login_entity.dart';
import '../args/login_args.dart';
import '../providers/login_ui_provider.dart';

part 'login_presenter.g.dart';

class LoginPresenter {
  final LoginArgs _args;
  final LoginUI _interface;
  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  LoginEntity loginEntity = LoginEntity(email: '', password: '');

  LoginPresenter(this._interface, this._args);

  Future<void> signIn() async {
    _interface.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signIn(loginEntity);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _interface.loginSuccess();
    }

    if (error != null) {
      _interface.showError(error.toString());
    }

    _interface.hideLoading();
  }
}

@riverpod
LoginPresenter loginPresenter(Ref ref, LoginArgs args) {
  final loginUI = ref.read(loginUIProvider.notifier);
  return LoginPresenter(loginUI, args);
}