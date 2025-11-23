import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/domain/providers/user_session_provider.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/expenses_provider.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/incomes_provider.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/organisms/organisms.dart';
import '../../domain/models/summary_type.dart';
import '../args/home_args.dart';
import '../mappers/home_mapper.dart';
import 'widgets/widgets.dart';

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
          backgroundColor: Colors.indigoAccent.shade200,
          appBar: AppBar(
            toolbarHeight: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            title:
                Text('${model.appbar.greeting} ${userSession.name}'),
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userSession.photo ?? model.appbar.avatar,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notification_important_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_outlined),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Pockets(),
                const SizedBox(height: 20),
                SummaryCard(
                  type: SummaryType.incomes,
                  title: model.incomesLabel,
                  description: 'Mes actual',
                  value: incomes,
                  callback: () {},
                ),
                const SizedBox(height: 10),
                SummaryCard(
                  type: SummaryType.expenses,
                  title: model.expensesLabel,
                  description: 'Mes actual',
                  value: expenses,
                  callback: () {},
                ),
                const SizedBox(height: 20),
                Balance(label: model.currentBalance),
                const SizedBox(height: 20),
                RecordsCategories(title: model.categoryExpenses),
                const SizedBox(height: 20),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
