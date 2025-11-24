import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../../domain/providers/user_session_provider.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/models/summary_type.dart';
import '../args/home_args.dart';
import '../mappers/home_mapper.dart';
import '../providers/expenses_provider.dart';
import '../providers/incomes_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';
  final HomeArgs args;

  const HomeScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final userSession = ref.watch(userSessionProvider);
    final incomes = ref.watch(incomesProvider);
    final expenses = ref.watch(expensesProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model = HomeMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.indigoAccent.shade200,
            toolbarHeight: sizeAppBar,
            title: Text(
              '${model.appBar.greeting} ${userSession.name}',
              style: TextStyle(color: Colors.white),
            ),
            leading: Padding(
              padding: EdgeInsets.all(padding10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userSession.photo ?? model.appBar.avatar,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Pockets(labelNewPocket: model.newPocketLabel),
                SizedBox(height: padding10),
                SummaryCard(
                  type: SummaryType.incomes,
                  title: model.incomesLabel,
                  description: model.descriptionIncomes,
                  value: incomes,
                  callback: () {},
                ),
                SizedBox(height: sizeBox20),
                SummaryCard(
                  type: SummaryType.expenses,
                  title: model.expensesLabel,
                  description: model.descriptionExpenses,
                  value: expenses,
                  callback: () {},
                ),
                SizedBox(height: sizeBox20),
                Balance(label: model.currentBalance),
                SizedBox(height: sizeBox20),
                RecordsCategories(title: model.categoryExpenses),
                SizedBox(height: sizeBox20),
                LastRecords(title: model.latestRecords),
                SizedBox(height: 100),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigoAccent.shade100,
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
