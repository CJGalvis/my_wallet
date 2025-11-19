import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_session_manager/user_session_manager.dart';

import 'app.dart';
import 'ui/features/screens.dart';
import 'ui/routes/app_router.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SessionManager().configure(
    onSessionExpired: () async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppRouter.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          LoginScreen.routeName,
          (r) => false,
        );
      });
    },
  );

  runApp(const App());
}

