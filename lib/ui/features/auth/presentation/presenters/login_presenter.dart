import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/features/auth/presentation/notifiers/login_interface_notifier.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/login_entity.dart';
import '../args/login_args.dart';

class LoginPresenter {
  final LoginArgs _args;
  final LoginInterfaceNotifier _interface;
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

final loginPresenterProvider =
    Provider.family<LoginPresenter, LoginArgs>(
  (ref, args) => LoginPresenter(
    ref.read(loginInterfaceProvider.notifier),
    args,
  ),
);
