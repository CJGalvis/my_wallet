import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/register_entity.dart';
import '../args/register_args.dart';
import '../providers/register_ui_provider.dart';

part 'register_presenter.g.dart';

class RegisterPresenter {
  final RegisterArgs _args;
  final RegiterUI _interface;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isValidForm() => formKey.currentState?.validate() ?? false;

  RegisterEntity registerEntity = RegisterEntity(
    username: '',
    email: '',
    password: '',
  );

  RegisterPresenter(this._interface, this._args);

  Future<void> signUp() async {
    _interface.showLoading();

    final (ErrorItem?, bool) response =
        await _args.config.authUseCase.signUp(registerEntity);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _interface.registerSuccess();
    }

    if (error != null) {
      _interface.showError(error.toString());
    }

    _interface.hideLoading();
  }
}

@riverpod
RegisterPresenter regiterPresenter(Ref ref, RegisterArgs args) {
  final registerUI =  ref.read(regiterUIProvider.notifier);
  return RegisterPresenter(registerUI, args);
}
