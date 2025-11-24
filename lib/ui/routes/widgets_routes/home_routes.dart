import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../application/config/assets_config_language.dart';
import '../../features/home/presentation/args/home_args.dart';
import '../../features/screens.dart';

class HomeRoutes {
  static HomeScreen getHomeScreen(BuildContext context) {
    return HomeScreen(
      args: HomeArgs(
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
        onPressedIncomes: () =>
            context.push(SummaryIncomesScreen.routeName),
        onPressedExpenses: () =>
            context.push(SummaryExpensesScreen.routeName),
      ),
    );
  }
}
