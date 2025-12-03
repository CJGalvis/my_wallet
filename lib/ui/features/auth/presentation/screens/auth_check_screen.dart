import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/providers/providers.dart';
import '../../../../design_system/design_system.dart';
import '../args/args.dart';
import '../mappers/auth_check_mapper.dart';
import '../models/auth_check_model_ui.dart';

class AuthCheckScreen extends ConsumerStatefulWidget {
  static const String routeName = '/check';
  final AuthCheckArgs args;

  const AuthCheckScreen({super.key, required this.args});

  @override
  ConsumerState<AuthCheckScreen> createState() =>
      _AuthCheckScreenState();
}

class _AuthCheckScreenState extends ConsumerState<AuthCheckScreen> {
  late AuthCheckModelUi _model;
  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);
    final sessionNotifier = ref.read(sessionManagerProvider);

    return asyncLabels.when(
      loading: () => LoadingScreen(),
      error: (error, stackTrace) => ErrorScreen(),
      data: (labelsMap) {
        _model = AuthCheckMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return Scaffold(
          body: FutureBuilder(
            future: sessionNotifier.getToken(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final String token = snapshot.data!;
                if (token.isNotEmpty) {
                  Future.microtask(
                    () => widget.args.checkSuccess.call(),
                  );
                } else {
                  Future.microtask(
                    () => widget.args.checkError.call(),
                  );
                }
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      _model.image,
                      width: 200,
                    ),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                    SizedBox(height: 20),
                    Text(_model.message),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
