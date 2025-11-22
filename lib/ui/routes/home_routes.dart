import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/screens.dart';

class HomeRoutes {
  static DashboardScreen getDashboardScreen(BuildContext context) {
    return DashboardScreen();
  }

  static ReportScreen getReportScreen(BuildContext context) {
    return ReportScreen();
  }

  static SettingsScreen getSettingsScreen(BuildContext context) {
    return SettingsScreen();
  }
}
