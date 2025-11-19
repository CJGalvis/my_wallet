import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_notifier.dart';
import '../../../../design_system/atoms/atoms.dart';
import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/molecules/molecules.dart';
import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
import '../../../../helpers/message_helper.dart';
import '../args/login_args.dart';
import '../helpers/constans.dart';
import '../helpers/form_validators.dart';
import '../helpers/theme.dart';
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
          args.onLoginSuccess.call();
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
            decoration: AuthTheme.getBackgroundGradient(),
            child: Padding(
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
                      ),
                      const SizedBox(height: 10),
                      ButtonText(
                        label: model.forgotPasswordLabel,
                        callback: () {},
                      ),
                      ButtonPrimary(
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
                ),
              ),
            ),
          ),
        );
      },
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
