import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/record_item.dart';
import 'records_provider.dart';

final recordsByPocketProvider =
    Provider.family<List<RecordItem>, String>((ref, pocket) {
      final records = ref.watch(recordsProvider);

      return records.when(
        loading: () => [],
        error: (error, _) => [],
        data: (data) =>
            data.where((item) => item.pocket == pocket).toList(),
      );
    });
