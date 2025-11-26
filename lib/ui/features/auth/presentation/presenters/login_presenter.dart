import 'package:flutter/material.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/login_entity.dart';
import '../args/login_args.dart';
import '../interfaces/login_interface.dart';

class LoginPresenter {
  final LoginArgs _args;
  final LoginInterface _interface;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  LoginEntity login = LoginEntity(email: '', password: '');

  LoginPresenter(this._interface, this._args);

  Future<void> signIn() async {
    _interface.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signIn(login);

    final ErrorItem? error = response.$1;
    final bool res = response.$2;

    if (res) {
      _interface.loginSuccess();
    }

    if (error != null) {
      _interface.showError(error.message);
    }

    _interface.hideLoading();
  }
}
