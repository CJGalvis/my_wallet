import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

import '../args/new_pocket_args.dart';
import '../interfaces/new_pocket_interface.dart';
import '../providers/providers.dart';

class NewPocketPresenter {
  final NewPocketArgs _args;
  final NewPocketInterface _interface;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  NewPocketPresenter(this._interface, this._args);

  Future<void> createPocket(WidgetRef ref, Pocket newPocket) async {
    _interface.showLoading();

    final (ErrorItem?, Pocket?) response = await _args.config.usecases
        .createPocket(newPocket);

    final ErrorItem? error = response.$1;
    final Pocket? data = response.$2;

    if (data != null) {
      ref.read(pocketsProvider.notifier).addPocket(data);
      _interface.createdSuccess();
    }

    if (error != null) {
      _interface.showError(error);
    }

    _interface.hideLoading();
  }
}
