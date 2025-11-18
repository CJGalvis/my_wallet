import 'package:flutter/material.dart';
import 'package:my_wallet/domain/providers/language_provider.dart';
import 'package:my_wallet/ui/design_system/organisms/loading_screen.dart';
import 'package:my_wallet/ui/features/auth/presentation/mappers/login_mapper.dart';
import 'package:provider/provider.dart';

import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/organisms/loading.dart';
import '../args/login_args.dart';
import '../helpers/constans.dart';
import '../helpers/form_validators.dart';
import '../models/login_model_ui.dart';
import '../interface/login_interface.dart';
import '../presenters/login_presenter.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  final LoginArgs args;

  const LoginScreen({super.key, required this.args});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginInterface {
  late LoginPresenter _presenter;
  late LoginModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        if (languageProvider.isLoading) {
          return const LoadingScreen();
        }

        _model = LoginMapper().fromMap(
          languageProvider.getWidgetsLabels(widget.args.language),
        );

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
                      _TitleScreen(model: _model),
                      const SizedBox(height: 30),
                      _LoginForm(
                          presenter: _presenter, model: _model),
                      const SizedBox(height: 10),
                      _ForgetPasswordButton(model: _model),
                      _LoginButton(
                          presenter: _presenter, model: _model),
                      _NewAccountButton(
                          widget: widget, model: _model),
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

  @override
  void initState() {
    _loading = Loading();
    _presenter = LoginPresenter(this, widget.args);
    super.initState();
  }

  @override
  void loginSuccess() {
    widget.args.onLoginSuccess?.call();
  }

  @override
  void showErrorMessage(String message) {
    widget.args.onLoginError?.call(message);
  }

  @override
  void hideLoading() {
    _loading.hide();
  }

  @override
  void showLoading() {
    _loading.show(context);
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
    required this.widget,
    required LoginModelUi model,
  }) : _model = model;

  final LoginScreen widget;
  final LoginModelUi _model;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.args.onNewAccount.call(),
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
