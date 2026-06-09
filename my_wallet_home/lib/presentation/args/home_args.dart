import 'package:flutter/material.dart';
import 'package:my_wallet_pockets/config/pockets_config.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

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
  final PocketsConfig pocketsConfig;
  final RecordConfig recordsConfig;

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
    required this.pocketsConfig,
    required this.recordsConfig,
    required this.onPressedExit,
  });
}
