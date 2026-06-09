import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_home/my_wallet_home.dart';
import 'package:my_wallet_pockets/config/config.dart';
import 'package:my_wallet_records/config/config.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/providers/pockets_gateway_provider.dart';
import '../../../domain/providers/records_gateway_provider.dart';

class HomeRoutes {
  static HomeScreen getHomeScreen(BuildContext context, Ref ref) {
    return HomeScreen(
      args: HomeArgs(
        pocketsConfig: PocketsConfig(
          pocketsApi: ref.read(pocketsGatewayProvider),
        ),
        recordsConfig: RecordConfig(
          recordsApi: ref.read(recordsGatewayProvider),
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
