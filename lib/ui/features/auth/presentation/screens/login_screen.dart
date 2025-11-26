import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/design_system.dart';
import '../args/login_args.dart';
import '../../../../helpers/helpers.dart';
import '../interfaces/login_interface.dart';
import '../mappers/login_mapper.dart';
import '../models/login_model_ui.dart';
import '../presenters/login_presenter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login';
  final LoginArgs args;

  const LoginScreen({super.key, required this.args});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    implements LoginInterface {
  late LoginPresenter _presenter;
  late LoginModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        _model = LoginMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return _LoginView(
          model: _model,
          presenter: _presenter,
          args: widget.args,
        );
      },
    );
  }

  @override
  void initState() {
    _presenter = LoginPresenter(this, widget.args);
    _loading = Loading();
    super.initState();
  }

  @override
  void hideLoading() => _loading.hide();

  @override
  void showLoading() => _loading.show(context);

  @override
  void showError(String message) {
    widget.args.onLoginError?.call(message);
    MessageHelper.showSnackBar(
      context,
      message: message,
      isError: true,
    );
  }

  @override
  void loginSuccess() => widget.args.onLoginSuccess.call();
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    required this.model,
    required this.presenter,
    required this.args,
  });

  final LoginModelUi model;
  final LoginPresenter presenter;
  final LoginArgs args;

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
                _LoginForm(
                  presenter: presenter,
                  model: model,
                  args: args,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm({
    required this.presenter,
    required this.model,
    required this.args,
  });

  final LoginPresenter presenter;
  final LoginModelUi model;
  final LoginArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: presenter.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Input(
            keyboardType: TextInputType.emailAddress,
            texthint: model.texthintEmail,
            label: model.labelEmail,
            onChanged: (value) => presenter.login.email = value,
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
            onChanged: (value) => presenter.login.password = value,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : model.textErrorPassword,
          ),
          const SizedBox(height: 10),
          ButtonText(
            label: model.forgotPasswordLabel,
            callback: () {},
          ),
          ButtonSecondary(
            label: model.singInBtnLabel,
            callback: () {
              FocusScope.of(context).unfocus();
              if (!presenter.isValidForm()) return;
              presenter.signIn();
            },
          ),
          ButtonText(
            label: model.singUpBtnLabel,
            callback: args.onNewAccount,
          ),
        ],
      ),
    );
  }
}
