import 'package:my_wallet/ui/features/home/presentation/providers/records_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';

part 'records_by_pocket_provider.g.dart';

@riverpod
List<RecordItem> recordsByPocket(Ref ref, String pocket) {
  final records = ref.watch(recordsProvider);
  return records.isEmpty
      ? []
      : records.where((item) => item.pocket == pocket).toList();
}
