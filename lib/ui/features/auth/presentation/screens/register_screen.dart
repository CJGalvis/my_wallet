import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
import '../args/register_args.dart';
import '../helpers/constans.dart';
import '../helpers/form_validators.dart';
import '../interface/register_interface.dart';
import '../mappers/register_mapper.dart';
import '../models/register_model_ui.dart';
import '../presenters/register_presenter.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  final RegisterArgs args;

  const RegisterScreen({super.key, required this.args});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterInterface {
  late RegisterPresenter _presenter;
  late RegisterModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const LoadingScreen();
        }

        _model = RegisterMapper().fromMap(
          value.getWidgetsLabels(widget.args.language),
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
                      _RegisterForm(
                          presenter: _presenter, model: _model),
                      _AlreadyAccountButton(
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
    _presenter = RegisterPresenter(this, widget.args);
    super.initState();
  }

  @override
  void registerSuccess() {
    widget.args.onRegisterSuccess.call();
  }

  @override
  void showErrorMessage(String message) {
    widget.args.onRegisterError?.call(message);
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
    required RegisterModelUi model,
  }) : _model = model;

  final RegisterModelUi _model;

  @override
  Widget build(BuildContext context) {
    return Text(
      _model.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class _AlreadyAccountButton extends StatelessWidget {
  const _AlreadyAccountButton({
    required this.widget,
    required RegisterModelUi model,
  }) : _model = model;

  final RegisterScreen widget;
  final RegisterModelUi _model;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => widget.args.onAlreadyAccount.call(),
      child: Text(
        _model.singInBtnLabel,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    required RegisterPresenter presenter,
    required RegisterModelUi model,
  })  : _presenter = presenter,
        _model = model;

  final RegisterPresenter _presenter;
  final RegisterModelUi _model;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _presenter.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Input(
            texthint: _model.texthintUsername,
            label: _model.labelUsername,
            onChanged: (value) =>
                _presenter.registerEntity.username = value,
            validator: (value) =>
                FormValidators.textValidator(value ?? 'ƒ')
                    ? null
                    : _model.textErrorUsername,
          ),
          const SizedBox(height: 20),
          Input(
            keyboardType: TextInputType.emailAddress,
            texthint: _model.texthintEmail,
            label: _model.labelEmail,
            onChanged: (value) =>
                _presenter.registerEntity.email = value,
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
                _presenter.registerEntity.password = value,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : _model.textErrorPassword,
          ),
          const SizedBox(height: 20),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.indigo,
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (!_presenter.isValidForm()) return;
              _presenter.signUp();
            },
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: Center(
                child: Text(
                  _model.singUpBtnLabel,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
