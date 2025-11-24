import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/application/config/assets_config_language.dart';
import 'package:my_wallet/ui/features/home/presentation/args/new_pocket_args.dart';
import 'package:my_wallet/ui/features/screens.dart';

class PocketsRoutes {
  static NewPocketScreen getNewPocketScreen(BuildContext context) {
    return NewPocketScreen(
      args: NewPocketArgs(
        language: AssetsConfigLanguage.assetsLanguageNewPocket,
        onPressedPrimaryButton: () => context.pop(),
      ),
    );
  }
}
