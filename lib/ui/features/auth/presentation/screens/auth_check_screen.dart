
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
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  void _checkSession() async {
    final sessionNotifier = ref.read(sessionManagerProvider);
    final token = await sessionNotifier.getToken();

    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (token.isNotEmpty) {
          widget.args.checkSuccess.call();
        } else {
           widget.args.checkError.call();
        }
      });
    }
  }
}
