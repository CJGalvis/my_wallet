import 'package:flutter/material.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

import '../../config/home_config.dart';


class HomeArgs {
  final String language;
  final VoidCallback onPressedProfile;
  final VoidCallback onPressedSettings;
  final VoidCallback onPressedNewRecord;
  final ValueChanged<Pocket> onPressedPocket;
  final VoidCallback onPressedRecords;
  final VoidCallback onPressedNewPocket;
  final VoidCallback onPressedIncomes;
  final VoidCallback onPressedExpenses;
  final VoidCallback onPressedExit;
  final HomeConfig homeConfig;

  HomeArgs({
    required this.language,
    required this.onPressedProfile,
    required this.onPressedSettings,
    required this.onPressedNewRecord,
    required this.onPressedPocket,
    required this.onPressedRecords,
    required this.onPressedNewPocket,
    required this.onPressedIncomes,
    required this.onPressedExpenses,
    required this.homeConfig,
    required this.onPressedExit,
  });
}
