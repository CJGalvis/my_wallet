import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/entities/register_entity.dart';
import '../args/register_args.dart';
import '../providers/register_interface_notifier.dart';

class RegisterPresenter {
  final RegisterArgs _args;
  final RegisterInterfaceNotifier _interface;
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


final registerPresenterProvider =
    Provider.family<RegisterPresenter, RegisterArgs>(
  (ref, args) => RegisterPresenter(
    ref.read(registerInterfaceProvider.notifier),
    args,
  ),
);

