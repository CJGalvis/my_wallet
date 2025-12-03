import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/design_system.dart';
import '../../../../helpers/helpers.dart';
import '../args/register_args.dart';
import '../interfaces/register_interface.dart';
import '../mappers/register_mapper.dart';
import '../models/register_model_ui.dart';
import '../presenters/register_presenter.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String routeName = '/register';
  final RegisterArgs args;

  const RegisterScreen({super.key, required this.args});

  @override
  ConsumerState<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    implements RegisterInterface {
  late RegisterPresenter _presenter;
  late RegisterModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        _model = RegisterMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return _RegisterView(
          model: _model,
          presenter: _presenter,
          args: widget.args,
        );
      },
    );
  }

  @override
  void initState() {
    _presenter = RegisterPresenter(this, widget.args);
    _loading = Loading(context);
    super.initState();
  }

  @override
  void showLoading() => _loading.show();

  @override
  void hideLoading() => _loading.hide();

  @override
  void registerSuccess() => widget.args.onRegisterSuccess.call();

  @override
  void showError(String message) {
    widget.args.onRegisterError?.call(message);
    MessageHelper.showSnackBar(
      context,
      message: message,
      isError: true,
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({
    required this.model,
    required this.presenter,
    required this.args,
  });

  final RegisterModelUi model;
  final RegisterPresenter presenter;
  final RegisterArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const FlutterLogo(size: 100),
                const SizedBox(height: 50),
                HeaderTitle(title: model.title),
                const SizedBox(height: 30),
                _RegisterForm(
                  presenter: presenter,
                  model: model,
                ),
                ButtonText(
                  label: model.singInBtnLabel,
                  callback: args.onAlreadyAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required this.presenter,
    required this.model,
  });

  final RegisterPresenter presenter;
  final RegisterModelUi model;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: presenter.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Input(
            texthint: model.texthintUsername,
            label: model.labelUsername,
            onChanged: (value) => presenter.register.username = value,
            validator: (value) =>
                FormValidators.textValidator(value ?? 'ƒ')
                    ? null
                    : model.textErrorUsername,
          ),
          const SizedBox(height: 20),
          Input(
            keyboardType: TextInputType.emailAddress,
            texthint: model.texthintEmail,
            label: model.labelEmail,
            onChanged: (value) => presenter.register.email = value,
            validator: (value) =>
                FormValidators.emailValidator(value ?? '')
                    ? null
                    : model.textErrorEmail,
          ),
          const SizedBox(height: 20),
          Input(
            obscureText: true,
            texthint: model.texthintPassword,
            label: model.labelPassword,
            onChanged: (value) => presenter.register.password = value,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : model.textErrorPassword,
          ),
          const SizedBox(height: 20),
          ButtonSecondary(
            label: model.singUpBtnLabel,
            callback: () {
              FocusScope.of(context).unfocus();
              if (!presenter.isValidForm()) return;
              presenter.signUp();
            },
          ),
        ],
      ),
    );
  }
}
