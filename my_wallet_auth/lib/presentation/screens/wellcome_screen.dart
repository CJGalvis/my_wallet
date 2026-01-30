import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

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
    _loading = Loading(context);
    super.initState();
  }

  @override
  void showError(ErrorItem error) {
    widget.args.onGoogleAuthError?.call(error);
    MessageHelper.showSnackBar(
      context,
      message: error.description,
      isError: true,
    );
  }

  @override
  void googleAuthSuccess() => widget.args.onGoogleAuthSuccess.call();

  @override
  void showLoading() => _loading.show();

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
            SizedBox(height: 20),
            ButtonSecondary(
              label: model.singInBtnLabel,
              callback: args.onLoginPressed,
            ),
            ButtonText(
              callback: args.onNewAccountPressed,
              label: model.labelNewAccount,
            ),
            SizedBox(height: 30),
            TextDisclaimer(description: model.policyText),
          ],
        ),
      ),
    );
  }
}
