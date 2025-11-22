import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../args/register_args.dart';
import '../providers/register_provider.dart';

part 'register_presenter.g.dart';

class RegisterPresenter {
  final RegisterArgs _args;
  final Register _registerProvider;

  GlobalKey<FormState> formKey = GlobalKey();
  bool isValidForm() => formKey.currentState?.validate() ?? false;

  RegisterPresenter(this._registerProvider, this._args);

  Future<void> signUp() async {
    _registerProvider.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signUp(_registerProvider.register);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _registerProvider.registerSuccess();
    }

    if (error != null) {
      _registerProvider.showError(error.toString());
    }

    _registerProvider.hideLoading();
  }
}

@riverpod
RegisterPresenter regiterPresenter(Ref ref, RegisterArgs args) {
  final registerUI =  ref.read(registerProvider.notifier);
  return RegisterPresenter(registerUI, args);
}
