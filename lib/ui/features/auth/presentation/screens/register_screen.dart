import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/providers/language_notifier.dart';
import '../../../../design_system/atoms/atoms.dart';
import '../../../../design_system/molecules/input.dart';
import '../../../../design_system/molecules/molecules.dart';
import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
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
      error: (err, st) => Text('Error: $err'),
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
          ButtonPrimary(
            label: _model.singUpBtnLabel,
            callback: () {
              FocusScope.of(context).unfocus();
              if (!_presenter.isValidForm()) return;
              _presenter.signUp();
            },
          ),
        ],
      ),
    );
  }
}
