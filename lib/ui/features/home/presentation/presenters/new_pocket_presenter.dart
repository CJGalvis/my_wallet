import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_type.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/models/pocket_model.dart';
import '../args/new_pocket_args.dart';
import '../interfaces/new_pocket_interface.dart';

class NewPocketPresenter {
  final NewPocketArgs _args;
  final NewPocketInterface _interface;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  Pocket newPocket = Pocket(
    id: '',
    type: PocketType.initial(),
    name: '',
    balance: 0,
  );

  NewPocketPresenter(this._interface, this._args);

  Future<void> createPocket() async {
    _interface.showLoading();
    final (ErrorItem?, bool) response =
        await _args.config.pocketsUseCases.createPocket(newPocket);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      _interface.createdSuccess();
    }

    if (error != null) {
      _interface.showError(error.message);
    }

    _interface.hideLoading();
  }
}
