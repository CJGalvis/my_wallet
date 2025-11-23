import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/presentation/args/home_args.dart';
import 'package:my_wallet/ui/features/screens.dart';

import '../../../application/config/assets_config_language.dart';

class HomeRoutes {
  static HomeScreen getHomeScreen(BuildContext context) {
    return HomeScreen(
      args: HomeArgs(
        language: AssetsConfigLanguage.assetsLanguageHome,
      ),
    );
  }
}
