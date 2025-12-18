import 'package:my_wallet/ui/features/home/domain/models/summary_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_record_provider.g.dart';

@riverpod
class SummaryTypeSelected extends _$SummaryTypeSelected {
  @override
  SummaryType build() {
    return SummaryType.incomes;
  }

  void changeType(SummaryType type) => state = type;
}
