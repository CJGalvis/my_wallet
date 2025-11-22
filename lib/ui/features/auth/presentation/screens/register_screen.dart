import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_provider.dart';
import '../../../../design_system/atoms/atoms.dart';
import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/molecules/molecules.dart';
import '../../../../design_system/organisms/organisms.dart';
import '../../../../helpers/message_helper.dart';
import '../args/register_args.dart';
import '../helpers/constans.dart';
import '../helpers/form_validators.dart';
import '../helpers/theme.dart';
import '../mappers/register_mapper.dart';
import '../models/register_model_ui.dart';
import '../notifiers/register_interface_notifier.dart';
import '../presenters/register_presenter.dart';
import '../states/register_interface_state.dart';

class RegisterScreen extends ConsumerWidget {
  static const String routeName = '/register';
  final RegisterArgs args;

  const RegisterScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLabels = ref.watch(languageProvider);
    final presenter = ref.read(registerPresenterProvider(args));

    ref.listen<RegisterInterfaceState>(
      registerInterfaceProvider,
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

        if (next.registerSuccess) {
          args.onRegisterSuccess.call();
        }
      },
    );

    return asyncLabels.when(
      loading: () => const LoadingScreen(),
      error: (err, st) => ErrorScreen(),
      data: (labelsMap) {
        final model =
            RegisterMapper().fromMap(labelsMap[args.language]!);

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
          ),
        );
      },
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
            onChanged: (value) =>
                presenter.registerEntity.username = value,
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
            onChanged: (value) =>
                presenter.registerEntity.email = value,
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
            onChanged: (value) =>
                presenter.registerEntity.password = value,
            validator: (value) =>
                FormValidators.minLength(value, minValueLength)
                    ? null
                    : model.textErrorPassword,
          ),
          const SizedBox(height: 20),
          ButtonPrimary(
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
