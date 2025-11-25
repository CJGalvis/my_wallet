import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/factories/pockets_factory.dart';
import '../../features/home/config/new_pocket_config.dart';
import '../../features/home/presentation/args/new_pocket_args.dart';
import '../../features/screens.dart';

class PocketsRoutes {
  static NewPocketScreen getNewPocketScreen(BuildContext context) {
    return NewPocketScreen(
      args: NewPocketArgs(
        language: AssetsConfigLanguage.assetsLanguageNewPocket,
        createdSuccess: () => context.pop(),
        config: NewPocketConfig(
          PocketsGatewayFactory(context).pocketsGateway,
        ),
      ),
    );
  }
}
