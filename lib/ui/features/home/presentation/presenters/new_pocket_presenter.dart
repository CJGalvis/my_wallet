import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/models/pocket_model.dart';
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
    final (ErrorItem?, bool) response =
        await _args.config.pocketsUseCases.createPocket(newPocket);

    final ErrorItem? error = response.$1;
    final bool success = response.$2;

    if (success) {
      ref.read(pocketProvider.notifier).addNewPocket(newPocket);
      _interface.createdSuccess();
    }

    if (error != null) {
      _interface.showError(error.message);
    }

    _interface.hideLoading();
  }
}
