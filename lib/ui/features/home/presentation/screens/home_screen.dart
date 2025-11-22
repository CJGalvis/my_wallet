import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/routes/routes.dart';

import '../providers/navigation_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = [
      HomeRoutes.getDashboardScreen(context),
      HomeRoutes.getReportScreen(context),
      HomeRoutes.getSettingsScreen(context),
    ];

    final navigation = ref.watch(navigationProvider);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          ref
              .read(navigationProvider.notifier)
              .changeTab(value, context);
        },
        currentIndex: navigation,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Ajustes',
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: IndexedStack(
          key: ValueKey(
            navigation,
          ),
          index: navigation,
          children: screens,
        ),
      ),
    );
  }
}
