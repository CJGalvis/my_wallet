import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/providers.dart';
import '../../../../design_system/design_system.dart';
import '../../domain/models/summary_type.dart';
import '../args/home_args.dart';
import '../mappers/home_mapper.dart';
import '../providers/providers.dart';
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
    final themeMode = ref.watch(themeAppProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model = HomeMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: sizeAppBar,
            title: _GreetingUser(
              '${model.appBar.greeting} ${userSession.name}',
            ),
            leading: _Avatar(
              photo: userSession.photo ?? model.appBar.avatar,
            ),
            actions: [
              _SettingsButton(),
              _ThemeModeButton(
                themeMode: themeMode,
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
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        );
      },
    );
  }
}

class _GreetingUser extends StatelessWidget {
  const _GreetingUser(
    this.greeting,
  );

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Text(greeting);
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.settings_outlined),
    );
  }
}

class _ThemeModeButton extends ConsumerWidget {
  const _ThemeModeButton({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);

    return IconButton(
      icon: Icon(
        isDark ? Icons.light_mode : Icons.dark_mode,
      ),
      onPressed: () {
        ref.read(themeAppProvider.notifier).setTheme(
              themeMode == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding10),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          photo,
        ),
      ),
    );
  }
}
