import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_session_manager/user_session_manager.dart';

import 'ui/features/screens.dart';
import 'ui/routes/routes.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SessionManager().configure(
    onSessionExpired: () async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          LoginScreen.routeName,
          (r) => false,
        );
      });
    },
  );

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'My Wallet App',
      initialRoute: WellcomeScreen.routeName,
      routes: {
        WellcomeScreen.routeName: AuthRoutes.getWellcomeScreen,
        LoginScreen.routeName: AuthRoutes.getLoginScreen,
        RegisterScreen.routeName: AuthRoutes.getRegisterScreen,
      },
    );
  }
}
