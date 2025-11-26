import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/providers.dart';
import '../../../../design_system/design_system.dart';
import '../../../../helpers/message_helper.dart';
import '../args/wellcome_args.dart';
import '../interfaces/wellcome_interface.dart';
import '../mappers/wellcome_mapper.dart';
import '../models/wellcome_model_ui.dart';
import '../presenters/wellcome_presenter.dart';

class WellcomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/wellcome';
  final WellcomeArgs args;

  const WellcomeScreen({super.key, required this.args});

  @override
  ConsumerState<WellcomeScreen> createState() =>
      _WellcomeScreenState();
}

class _WellcomeScreenState extends ConsumerState<WellcomeScreen>
    implements WellcomeInterface {
  late Loading _loading;
  late WellcomePresenter _presenter;
  late WellcomeModelUi _model;

  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        _model = WellcomeMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return _WellcomeView(
          model: _model,
          args: widget.args,
          presenter: _presenter,
        );
      },
    );
  }

  @override
  void initState() {
    _presenter = WellcomePresenter(this, widget.args);
    _loading = Loading();
    super.initState();
  }

  @override
  void showError(String message) {
    widget.args.onGoogleAuthError?.call(message);
    MessageHelper.showSnackBar(
      context,
      message: message,
      isError: true,
    );
  }

  @override
  void googleAuthSuccess() => widget.args.onGoogleAuthSuccess.call();

  @override
  void showLoading() => _loading.show(context);

  @override
  void hideLoading() => _loading.hide();
}

class _WellcomeView extends StatelessWidget {
  const _WellcomeView({
    required this.model,
    required this.args,
    required this.presenter,
  });

  final WellcomeModelUi model;
  final WellcomeArgs args;
  final WellcomePresenter presenter;

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
              presenter: presenter,
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
    required this.presenter,
  });

  final WellcomeModelUi model;
  final WellcomeArgs args;
  final WellcomePresenter presenter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
