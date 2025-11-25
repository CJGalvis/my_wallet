import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/providers.dart';
import '../../../../design_system/design_system.dart';
import '../../../../helpers/message_helper.dart';
import '../args/wellcome_args.dart';
import '../mappers/wellcome_mapper.dart';
import '../models/wellcome_model_ui.dart';
import '../presenters/wellcome_presenter.dart';
import '../providers/wellcome_provider.dart';
import '../states/wellcome_state.dart';

class WellcomeScreen extends ConsumerWidget {
  static const String routeName = '/wellcome';
  final WellcomeArgs args;

  const WellcomeScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final sessionNotifier = ref.watch(userSessionProvider.notifier);

    ref.listen<WellcomeState>(
      wellcomeProvider,
      (previous, next) {
        if (next.isLoading) {
          Loading().show(context);
        } else {
          Loading().hide();
        }

        if (next.errorMessage.isNotEmpty) {
          args.onGoogleAuthError?.call(next.errorMessage);
          MessageHelper.showSnackBar(
            context,
            message: next.errorMessage,
            isError: true,
          );
        }

        if (next.signedIn) {
          sessionNotifier.setUserSession(next.userAuth);
          args.onGoogleAuthSuccess.call();
        }
      },
    );

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model = WellcomeMapper().fromMap(
          labelsMap[args.language]!,
        );

        return _WellcomeView(
          model: model,
          args: args,
        );
      },
    );
  }
}

class _WellcomeView extends StatelessWidget {
  const _WellcomeView({
    required this.model,
    required this.args,
  });

  final WellcomeModelUi model;
  final WellcomeArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 150),
            FlutterLogo(size: 150),
            SizedBox(height: 50),
            HeaderTitle(title: model.title),
            SizedBox(height: 30),
            _OptionsAuth(
              model: model,
              args: args,
            ),
            SizedBox(height: 20),
            ButtonSecondary(
              label: model.singInBtnLabel,
              callback: args.onLoginPressed,
            ),
            SizedBox(height: 30),
            TextDisclaimer(description: model.policyText),
          ],
        ),
      ),
    );
  }
}

class _OptionsAuth extends ConsumerWidget {
  const _OptionsAuth({
    required this.model,
    required this.args,
  });

  final WellcomeModelUi model;
  final WellcomeArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.read(wellcomePresenterProvider(args));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonCircularSVG(
          bottomLabel: model.labelGoogle,
          callback: () => presenter.signWithGoogle(),
          path: 'assets/icons/google.svg',
        ),
        const SizedBox(width: 10),
        ButtonCircular(
          bottomLabel: model.labelNewAccount,
          callback: args.onNewAccountPressed,
          icon: Icons.person_add_alt_1_outlined,
        ),
      ],
    );
  }
}
