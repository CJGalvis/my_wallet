import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import 'application/config/assets_config_language.dart';
import 'ui/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(overrides: [
      languageProvider.overrideWith(
        () => LanguageNotifier(
          assetsFileNames: AssetsConfigLanguage.assetsFileNames,
        ),
      )
    ], child: const MyApp());
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeAppProvider);

    return MaterialApp.router(
      title: 'My Wallet App',
      routerConfig: router,
      theme: AppLightTheme.theme(),
      darkTheme: AppDarkTheme.theme(),
      themeMode: themeMode,
    );
  }
}
