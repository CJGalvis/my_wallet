import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/design_system.dart';
import '../args/login_args.dart';
import '../../../../helpers/helpers.dart';
import '../mappers/login_mapper.dart';
import '../models/login_model_ui.dart';
import '../presenters/login_presenter.dart';
import '../providers/login_provider.dart';
import '../states/login_state.dart';

class LoginScreen extends ConsumerWidget {
  static const String routeName = '/login';
  final LoginArgs args;

  const LoginScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final presenter = ref.read(loginPresenterProvider(args));

    ref.listen<LoginState>(
      loginProvider,
      (previous, next) {
        if (next.isLoading) {
          Loading().show(context);
        } else {
          Loading().hide();
        }

        if (next.errorMessage.isNotEmpty) {
          args.onLoginError?.call(next.errorMessage);
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
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model =
            LoginMapper().fromMap(labelsMap[args.language]!);

        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: AuthTheme.getBackground(),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm({
    required this.presenter,
    required this.model,
  });

  final LoginPresenter presenter;
  final LoginModelUi model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider.notifier);

    return Form(
      key: presenter.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Input(
            keyboardType: TextInputType.emailAddress,
            texthint: model.texthintEmail,
            label: model.labelEmail,
            onChanged: loginNotifier.setEmail,
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
            onChanged: loginNotifier.setPassword,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : model.textErrorPassword,
          ),
        ],
      ),
    );
  }
}
