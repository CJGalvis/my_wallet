import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/design_system/tokens/sizes.dart';
import 'package:my_wallet_core/helpers/message_helper.dart';
import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/config/pockets_config.dart';
import 'package:my_wallet_records/domain/models/record_item.dart';
import 'package:my_wallet_records/presentation/widgets/summary_card.dart';

import '../../domain/models/summary_type.dart';
import '../interfaces/records_summary_interface.dart';
import '../presenters/records_presenter.dart';
import '../providers/providers.dart';

class RecordsSummary extends ConsumerStatefulWidget {
  final String incomesTitle;
  final String incomesDescription;
  final String expensesTitle;
  final String expensesDescription;
  final RecordConfig config;
  final VoidCallback onPressedIncomes;
  final VoidCallback onPressedExpenses;

  const RecordsSummary({
    super.key,
    required this.incomesTitle,
    required this.incomesDescription,
    required this.expensesTitle,
    required this.expensesDescription,
    required this.config,
    required this.onPressedIncomes,
    required this.onPressedExpenses,
  });

  @override
  ConsumerState<RecordsSummary> createState() =>
      _RecordsSummaryState();
}

class _RecordsSummaryState extends ConsumerState<RecordsSummary>
    implements RecordsSummaryInterface {
  late RecordsPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    final incomes = ref.watch(incomesProvider);
    final expenses = ref.watch(expensesProvider);

    return Column(
      children: [
        SummaryCard(
          callback: widget.onPressedIncomes,
          type: SummaryType.incomes,
          title: widget.incomesTitle,
          description: widget.incomesDescription,
          value: incomes,
        ),
        SizedBox(height: sizeBox20),
        SummaryCard(
          callback: widget.onPressedExpenses,
          type: SummaryType.expenses,
          title: widget.expensesTitle,
          description: widget.expensesDescription,
          value: expenses,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _presenter = RecordsPresenter(this, widget.config);
    _presenter.getRecords();
  }

  @override
  void updateData(List<RecordItem> records) {
    if (!mounted) return;
    ref.read(recordsProvider.notifier).loadRecords(records);
  }

  @override
  void showError(ErrorItem error) {
    MessageHelper.showSnackBar(
      context,
      message: error.description,
      isError: true,
    );
  }
}
