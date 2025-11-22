import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../args/register_args.dart';
import '../providers/register_provider.dart';

part 'register_presenter.g.dart';

class RegisterPresenter {
  final RegisterArgs _args;
  final RegisterNotifier _registerNotifier;

  GlobalKey<FormState> formKey = GlobalKey();
  bool isValidForm() => formKey.currentState?.validate() ?? false;

  RegisterPresenter(this._registerNotifier, this._args);

  Future<void> signUp() async {
    _registerNotifier.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signUp(_registerNotifier.register);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _registerNotifier.registerSuccess();
    }

    if (error != null) {
      _registerNotifier.showError(error.toString());
    }

    _registerNotifier.hideLoading();
  }
}

@riverpod
RegisterPresenter regiterPresenter(Ref ref, RegisterArgs args) {
  final registerNotifier =  ref.read(registerProvider.notifier);
  return RegisterPresenter(registerNotifier, args);
}
