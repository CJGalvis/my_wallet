import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';

part 'records_provider.g.dart';

@riverpod
class RecordsNotifier extends _$RecordsNotifier {
  @override
  List<RecordItem> build() {
    return [];
  }
}
