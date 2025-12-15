import 'summary_type.dart';

class RecordItem {
  final String pocket;
  final double value;
  final DateTime date;
  final SummaryType type;
  final String tag;
  final String? description;

  RecordItem({
    this.description,
    required this.pocket,
    required this.value,
    required this.date,
    required this.type,
    required this.tag,
  });
}
