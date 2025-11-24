import 'package:flutter/material.dart';

import 'summary_type.dart';

class RecordItem {
  final IconData? icon;
  final String pocket;
  final String category;
  final double value;
  final DateTime date;
  final SummaryType type;
  final String? description;

  RecordItem({
    this.icon,
    this.description,
    required this.pocket,
    required this.category,
    required this.value,
    required this.date,
    required this.type,
  });
}
