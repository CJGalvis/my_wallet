import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/error_item.dart';
import '../../domain/models/pocket_model.dart';
import '../args/new_pocket_args.dart';

part 'new_pocket_presenter.g.dart';

class NewPocketPresenter {
  final NewPocketArgs _args;
  final NewPocketNotifier _notifier;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  NewPocketPresenter(this._notifier, this._args);

  Future<void> createPocket(Pocket data) async {
    _notifier.isLoading();
    final (ErrorItem?, Pocket?) response =
        await _args.config.pocketsUseCases.createPocket(data);

    final ErrorItem? error = response.$1;
    final Pocket? success = response.$2;

    if (success != null) {
      _notifier.createdSuccess(success);
    }

    if (error != null) {
      _notifier.showError(error.message);
    }

    _notifier.hideLoading();
  }
}

@riverpod
NewPocketPresenter newPocketPresenter(Ref ref, NewPocketArgs args) {
  final newPocketNotifier = ref.read(newPocketProvider.notifier);
  return NewPocketPresenter(newPocketNotifier, args);
}
