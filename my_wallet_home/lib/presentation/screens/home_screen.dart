import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/my_wallet_pockets.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

import '../args/home_args.dart';
import '../mappers/home_mapper.dart';
import '../models/home_model_ui.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/home';
  final HomeArgs args;

  const HomeScreen({super.key, required this.args});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model = HomeMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return _HomeView(model: model, args: widget.args);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class _HomeView extends ConsumerWidget {
  const _HomeView({required this.model, required this.args});

  final HomeModelUi model;
  final HomeArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSession = ref.watch(sessionProvider).user;
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: _buildAppBar(context, userSession, themeMode, () {
        ref.read(sessionProvider.notifier).clear();
        args.onPressedExit.call();
      }),
      body: ListView(
        children: [
          Pockets(
            textErrorLoadPockets: model.textErrorLoadPockets,
            labelNewPocket: model.newPocketLabel,
            onPressedPocket: args.onPressedPocket,
            onPressedNewPocket: args.onPressedNewPocket,
            config: args.pocketsConfig,
          ),
          SizedBox(height: padding10),
          RecordsSummary(
            incomesTitle: model.incomesLabel,
            incomesDescription: model.descriptionIncomes,
            expensesTitle: model.expensesLabel,
            expensesDescription: model.descriptionExpenses,
            config: args.recordsConfig,
            onPressedIncomes: args.onPressedIncomes,
            onPressedExpenses: args.onPressedExpenses,
          ),
          SizedBox(height: sizeBox20),
          Balance(label: model.currentBalance),
          SizedBox(height: sizeBox20),
          LastRecords(
            title: model.latestRecords,
            labelEmpty: model.latestRecordsEmpty,
            labelShowMore: model.labelShowMore,
            onPressedShowMore: args.onPressedRecords,
          ),
          SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: args.onPressedNewRecord,
        child: Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(
    BuildContext context,
    UserAuth? user,
    ThemeMode themeMode,
    VoidCallback exitPressed,
  ) {
    return AppBar(
      toolbarHeight: sizeAppBar,
      title: _GreetingUser('${model.appBar.greeting} ${user?.name}'),
      leading: _Avatar(
        onPressed: args.onPressedProfile,
        photo: user?.photo ?? '',
        photoDefault: model.appBar.avatar,
      ),
      actions: [
        IconButton(
          onPressed: args.onPressedSettings,
          icon: Icon(Icons.settings_outlined),
        ),
        _ThemeModeButton(themeMode: themeMode),
        IconButton(
          onPressed: () {
            exitPressed.call();
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}

class _GreetingUser extends StatelessWidget {
  const _GreetingUser(this.greeting);

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Text(greeting);
  }
}

class _ThemeModeButton extends ConsumerWidget {
  const _ThemeModeButton({required this.themeMode});

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider.notifier).isDark(context);

    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        ref
            .read(themeProvider.notifier)
            .setTheme(isDark ? ThemeMode.light : ThemeMode.dark);
      },
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.photo,
    required this.onPressed,
    required this.photoDefault,
  });

  final String photo;
  final VoidCallback onPressed;
  final String photoDefault;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding10),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            photo.isNotEmpty ? photo : photoDefault,
          ),
        ),
      ),
    );
  }
}
