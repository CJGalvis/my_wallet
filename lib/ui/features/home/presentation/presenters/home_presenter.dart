import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/domain/providers/session_manager_provider.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';
import 'package:my_wallet/ui/features/home/presentation/args/home_args.dart';
import 'package:my_wallet/ui/features/home/presentation/interfaces/home_interface.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/pockets_cloud_provider.dart';

import '../../../../../domain/models/error_item.dart';

class HomePresenter {
  final HomeArgs _args;
  final HomeInterface _interface;

  HomePresenter(this._interface, this._args);

  Future<void> getPockets(WidgetRef ref) async {
    final session = ref.read(sessionManagerProvider);
    final userSession = await session.getUserSession();

    final (ErrorItem?, List<Pocket>?) response = await _args
        .pocketsconfig.usecases
        .getPockets(userSession?['email']);

    final ErrorItem? error = response.$1;
    final List<Pocket>? data = response.$2;

    if (error != null) {
      _interface.showError(error.message);
    }

    ref.read(pocketsCloudProvider.notifier).setData(data ?? []);
  }
}
