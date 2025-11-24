import 'package:flutter/material.dart';

import '../../domain/models/pocket_model.dart';

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
  });
}
