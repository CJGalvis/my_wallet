import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/ui/features/screens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0;

  static const _routes = [
    DashboardScreen.routeName,
    ReportScreen.routeName,
    SettingsScreen.routeName,
  ];

  void changeTab(int index, BuildContext context) {
    state = index;
    context.go(_routes[index]);
  }
}
