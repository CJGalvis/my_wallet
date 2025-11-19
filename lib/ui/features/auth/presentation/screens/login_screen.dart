import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_notifier.dart';
import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
import '../../../../helpers/message_helper.dart';
import '../args/login_args.dart';
import '../helpers/constans.dart';
import '../helpers/form_validators.dart';
import '../mappers/login_mapper.dart';
import '../models/login_model_ui.dart';
import '../notifiers/login_interface_notifier.dart';
import '../presenters/login_presenter.dart';
import '../states/login_interface_state.dart';

class LoginScreen extends ConsumerWidget {
  static const String routeName = '/login';
  final LoginArgs args;

  const LoginScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final presenter = ref.read(loginPresenterProvider(args));

    ref.listen<LoginInterfaceState>(
      loginInterfaceProvider,
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

        if (next.loginSuccess) {
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
            LoginMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.black,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const FlutterLogo(size: 100),
                      const SizedBox(height: 50),
                      _TitleScreen(model: model),
                      const SizedBox(height: 30),
                      _LoginForm(
                        presenter: presenter,
                        model: model,
                      ),
                      const SizedBox(height: 10),
                      _ForgetPasswordButton(model: model),
                      _LoginButton(
                        presenter: presenter,
                        model: model,
                      ),
                      _NewAccountButton(
                        model: model,
                        callback: () => args.onNewAccount.call(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TitleScreen extends StatelessWidget {
  const _TitleScreen({
    required LoginModelUi model,
  }) : _model = model;

  final LoginModelUi _model;

  @override
  Widget build(BuildContext context) {
    return Text(
      _model.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  const _ForgetPasswordButton({
    required LoginModelUi model,
  }) : _model = model;

  final LoginModelUi _model;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        _model.forgotPasswordLabel,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _NewAccountButton extends StatelessWidget {
  const _NewAccountButton({
    required LoginModelUi model,
    required this.callback,
  }) : _model = model;

  final LoginModelUi _model;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(
        _model.singUpBtnLabel,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required LoginPresenter presenter,
    required LoginModelUi model,
  })  : _presenter = presenter,
        _model = model;

  final LoginPresenter _presenter;
  final LoginModelUi _model;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      color: Colors.indigo,
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (!_presenter.isValidForm()) return;
        _presenter.signIn();
      },
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(
            _model.singInBtnLabel,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required LoginPresenter presenter,
    required LoginModelUi model,
  })  : _presenter = presenter,
        _model = model;

  final LoginPresenter _presenter;
  final LoginModelUi _model;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _presenter.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Input(
            keyboardType: TextInputType.emailAddress,
            texthint: _model.texthintEmail,
            label: _model.labelEmail,
            onChanged: (value) =>
                _presenter.loginEntity.email = value,
            validator: (value) =>
                FormValidators.emailValidator(value ?? '')
                    ? null
                    : _model.textErrorEmail,
          ),
          const SizedBox(height: 20),
          Input(
            obscureText: true,
            texthint: _model.texthintPassword,
            label: _model.labelPassword,
            onChanged: (value) =>
                _presenter.loginEntity.password = value,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : _model.textErrorPassword,
          ),
        ],
      ),
    );
  }
}
