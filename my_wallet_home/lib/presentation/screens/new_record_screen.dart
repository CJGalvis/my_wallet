import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/helpers/format_helper.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import '../../domain/models/summary_type.dart';
import '../providers/providers.dart';

class NewRecordScreen extends ConsumerStatefulWidget {
  static const String routeName = '/new-record';
  const NewRecordScreen({super.key});

  @override
  ConsumerState<NewRecordScreen> createState() =>
      _NewRecordScreenState();
}

class _NewRecordScreenState extends ConsumerState<NewRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return _NewRecordView();
  }
}

class _NewRecordView extends ConsumerWidget {
  const _NewRecordView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summarySelected = ref.watch(summaryTypeSelectedProvider);

    final isIncome = summarySelected == SummaryType.incomes;

    return Scaffold(
      appBar: AppBar(title: Text('New record')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Center(
              child: SegmentedButton(
                segments: [
                  ButtonSegment(
                    value: SummaryType.incomes,
                    icon: Text('Ingreso'),
                  ),
                  ButtonSegment(
                    value: SummaryType.expenses,
                    icon: Text('Egreso'),
                  ),
                ],
                selected: <SummaryType>{summarySelected},
                onSelectionChanged: (value) {
                  ref
                      .read(summaryTypeSelectedProvider.notifier)
                      .changeType(value.first);
                },
              ),
            ),
            const SizedBox(height: 10),
            CustomCard(
              child: Column(
                children: [
                  _CustomInputBalance(
                    isIncome: isIncome,
                    onPressed: () => _openBottomSheetBalance(context),
                  ),
                  const SizedBox(height: 20),
                  _CustomInput(
                    icon: Icons.account_balance_outlined,
                    label: 'Bolsillo',
                    textHint: 'Seleccione',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  _CustomInput(
                    icon: Icons.beenhere_outlined,
                    label: 'Etiqueta',
                    textHint: 'Seleccione',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  _CustomInput(
                    icon: Icons.text_fields_outlined,
                    label: 'Descripción',
                    textHint: '',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openBottomSheetBalance(
    BuildContext context,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: Text('hola'),
        );
      },
    );
  }
}

class _CustomInputBalance extends StatelessWidget {
  const _CustomInputBalance({
    required this.isIncome,
    required this.onPressed,
  });

  final bool isIncome;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final color = isIncome ? Colors.green : Colors.redAccent;

    final symbol = isIncome ? '+' : '-';

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    color: Theme.of(context).highlightColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Valor',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              Text(
                '$symbol \$ ${FormatHelper.currency(120000)}',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(
                      color: color,
                    ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _CustomInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final String textHint;
  final Function() onPressed;

  const _CustomInput({
    required this.icon,
    required this.label,
    required this.textHint,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).highlightColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    textHint,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).highlightColor,
                  )
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
