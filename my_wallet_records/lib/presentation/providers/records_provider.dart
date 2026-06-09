import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/record_item.dart';

final recordsProvider =
    NotifierProvider<RecordsNotifier, AsyncValue<List<RecordItem>>>(
      RecordsNotifier.new,
    );

class RecordsNotifier extends Notifier<AsyncValue<List<RecordItem>>> {
  @override
  AsyncValue<List<RecordItem>> build() {
    return AsyncValue.loading();
  }

  Future<void> loadRecords(List<RecordItem> data) async {
    try {
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
