import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/design_system.dart';
import '../../../../helpers/message_helper.dart';
import '../args/wellcome_args.dart';
import '../../../../helpers/theme.dart';
import '../mappers/wellcome_mapper.dart';
import '../models/wellcome_model_ui.dart';
import '../presenters/wellcome_presenter.dart';
import '../providers/wellcome_interface_notifier.dart';
import '../states/wellcome_interface_state.dart';

class WellcomeScreen extends ConsumerWidget {
  static const String routeName = '/wellcome';
  final WellcomeArgs args;

  const WellcomeScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final presenter = ref.read(wellcomePresenterProvider(args));

    ref.listen<WellcomeInterfaceState>(
      wellcomeInterfaceProvider,
      (previous, next) {
        if (next.isLoading) {
          Loading().show(context);
        } else {
          Loading().hide();
        }

        if (next.errorMessage.isNotEmpty) {
          MessageHelper.showSnackBar(
            context,
            message: next.errorMessage,
            isError: true,
          );
        }

        if (next.signedIn) {
          args.onGoogleAuthSuccess.call();
        }
      },
    );

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model =
            WellcomeMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: AuthTheme.getBackgroundGradient(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  const FlutterLogo(size: 150),
                  const SizedBox(height: 50),
                  HeaderTitle(title: model.title),
                  const SizedBox(height: 30),
                  _OptionsAuth(
                    presenter: presenter,
                    model: model,
                    args: args,
                  ),
                  const SizedBox(height: 20),
                  ButtonSecondary(
                    label: model.singInBtnLabel,
                    callback: args.onLoginPressed,
                  ),
                  const SizedBox(height: 30),
                  TextDisclaimer(description: model.policyText),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OptionsAuth extends StatelessWidget {
  const _OptionsAuth({
    required this.presenter,
    required this.model,
    required this.args,
  });

  final WellcomePresenter presenter;
  final WellcomeModelUi model;
  final WellcomeArgs args;

  @override
  Widget build(BuildContext context) {
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
