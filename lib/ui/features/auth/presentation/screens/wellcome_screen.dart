import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../domain/providers/language_notifier.dart';
import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
import '../../../../helpers/message_helper.dart';
import '../args/wellcome_args.dart';
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
          debugPrint('por aquí pasó');
          // Navegar a la siguiente pantalla
        }
      },
    );

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => Text('Error: $err'),
      data: (labelsMap) {
        final model =
            WellcomeMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: _getGradient(),
            child: Column(
              children: [
                const SizedBox(height: 150),
                const FlutterLogo(size: 150),
                const SizedBox(height: 50),
                _TitleScreen(model: model),
                const SizedBox(height: 30),
                _OptionsAuth(
                  presenter: presenter,
                  model: model,
                  args: args,
                ),
                const SizedBox(height: 20),
                _ButtonSignIn(args: args, model: model),
                const SizedBox(height: 30),
                _TextPolicy(model: model),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _getGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.indigo,
          Colors.black,
        ],
      ),
    );
  }
}

class _TextPolicy extends StatelessWidget {
  const _TextPolicy({
    required this.model,
  });

  final WellcomeModelUi model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        model.policyText,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white24),
      ),
    );
  }
}

class _ButtonSignIn extends StatelessWidget {
  const _ButtonSignIn({
    required this.args,
    required this.model,
  });

  final WellcomeArgs args;
  final WellcomeModelUi model;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      color: Colors.white,
      onPressed: () => args.onLoginPressed.call(),
      child: SizedBox(
        width: 250,
        height: 45,
        child: Center(
          child: Text(
            model.singInBtnLabel,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
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
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  presenter.signWithGoogle();
                },
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    Colors.blue,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Text(
              model.labelGoogle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => args.onNewAccountPressed.call(),
                icon: const Icon(
                  Icons.person_add_alt_1_outlined,
                  size: 30,
                ),
              ),
            ),
            Text(
              model.labelNewAccount,
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}

class _TitleScreen extends StatelessWidget {
  const _TitleScreen({
    required this.model,
  });

  final WellcomeModelUi model;

  @override
  Widget build(BuildContext context) {
    return Text(
      model.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
