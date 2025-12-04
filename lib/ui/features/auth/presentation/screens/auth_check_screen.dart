import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/providers.dart';
import '../args/args.dart';

class AuthCheckScreen extends ConsumerStatefulWidget {
  static const String routeName = '/check';
  final AuthCheckArgs args;

  const AuthCheckScreen({super.key, required this.args});

  @override
  ConsumerState<AuthCheckScreen> createState() =>
      _AuthCheckScreenState();
}

class _AuthCheckScreenState extends ConsumerState<AuthCheckScreen> {
  @override
  Widget build(BuildContext context) {
    final sessionNotifier = ref.read(sessionManagerProvider);

    return Scaffold(
      body: FutureBuilder(
        future: sessionNotifier.getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final String token = snapshot.data!;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (token.isNotEmpty) {
                widget.args.checkSuccess.call();
              } else {
                widget.args.checkError.call();
              }
            });
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
