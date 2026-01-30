import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet_home/my_wallet_home.dart';
import 'package:my_wallet_pockets/my_wallet_pockets.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/factories/pockets_factory.dart';

class PocketsRoutes {
  static NewPocketScreen getNewPocketScreen(BuildContext context) {
    return NewPocketScreen(
      args: NewPocketArgs(
        language: AssetsConfigLanguage.assetsLanguageNewPocket,
        createdSuccess: () => context.pop(),
        config: PocketsConfig(
          PocketsGatewayFactory(context).pocketsGateway,
        ),
      ),
    );
  }
}
