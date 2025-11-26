import 'package:flutter/material.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/register_entity.dart';
import '../args/register_args.dart';
import '../interfaces/register_interface.dart';

class RegisterPresenter {
  final RegisterArgs _args;
  final RegisterInterface _interface;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  RegisterEntity register = RegisterEntity(
    username: '',
    email: '',
    password: '',
  );

  RegisterPresenter(this._interface, this._args);

  Future<void> signUp() async {
    _interface.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signUp(register);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _interface.registerSuccess();
    }

    if (error != null) {
      _interface.showError(error.message);
    }

    _interface.hideLoading();
  }
}
