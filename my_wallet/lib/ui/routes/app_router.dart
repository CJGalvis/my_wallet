import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_home/my_wallet_home.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final key = ref.watch(navigatorKeyProvider);

  return GoRouter(
    navigatorKey: key,
    initialLocation: AuthCheckScreen.routeName,
    routes: [
      GoRoute(
        path: AuthCheckScreen.routeName,
        name: AuthCheckScreen.routeName,
        builder: (context, _) =>
            AuthRoutes.getAuthCheckScreen(context),
      ),
      GoRoute(
        path: WellcomeScreen.routeName,
        name: WellcomeScreen.routeName,
        builder: (context, _) =>
            AuthRoutes.getWellcomeScreen(context),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        name: LoginScreen.routeName,
        builder: (context, _) => AuthRoutes.getLoginScreen(context),
      ),
      GoRoute(
        path: RegisterScreen.routeName,
        name: RegisterScreen.routeName,
        builder: (context, _) =>
            AuthRoutes.getRegisterScreen(context),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        name: HomeScreen.routeName,
        builder: (context, _) => HomeRoutes.getHomeScreen(context),
      ),
      GoRoute(
        path: ProfileScreen.routeName,
        name: ProfileScreen.routeName,
        builder: (context, _) => ProfileScreen(),
      ),
      GoRoute(
        path: SettingsScreen.routeName,
        name: SettingsScreen.routeName,
        builder: (context, _) => SettingsScreen(),
      ),
      GoRoute(
        path: NewPocketScreen.routeName,
        name: NewPocketScreen.routeName,
        builder: (context, _) =>
            PocketsRoutes.getNewPocketScreen(context),
      ),
      GoRoute(
        path: NewRecordScreen.routeName,
        name: NewRecordScreen.routeName,
        builder: (context, _) => NewRecordScreen(),
      ),
      GoRoute(
        path: PocketScreen.routeName,
        name: PocketScreen.routeName,
        builder: (context, state) => PocketScreen(
          pocket: state.extra as Pocket,
        ),
      ),
      GoRoute(
        path: RecordsScreen.routeName,
        name: RecordsScreen.routeName,
        builder: (context, _) => RecordsScreen(),
      ),
    ],
  );
});

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>(
    (ref) => GlobalKey<NavigatorState>());
