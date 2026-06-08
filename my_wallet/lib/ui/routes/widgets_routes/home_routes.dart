import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_home/my_wallet_home.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/providers/pockets_gateway_provider.dart';

class HomeRoutes {
  static HomeScreen getHomeScreen(BuildContext context, Ref ref) {
    return HomeScreen(
      args: HomeArgs(
        homeConfig: HomeConfig(
          pocketsApi: ref.read(pocketsGatewayProvider),
        ),
        language: AssetsConfigLanguage.assetsLanguageHome,
        onPressedProfile: () => context.push(ProfileScreen.routeName),
        onPressedSettings: () =>
            context.push(SettingsScreen.routeName),
        onPressedNewRecord: () =>
            context.push(NewRecordScreen.routeName),
        onPressedPocket: (value) => context.push(
          PocketScreen.routeName,
          extra: value,
        ),
        onPressedRecords: () => context.push(RecordsScreen.routeName),
        onPressedNewPocket: () =>
            context.push(NewPocketScreen.routeName),
        onPressedIncomes: () => context.push(RecordsScreen.routeName),
        onPressedExpenses: () =>
            context.push(RecordsScreen.routeName),
        onPressedExit: () => context.go(WellcomeScreen.routeName),
      ),
    );
  }
}
