import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/domain/providers/language_provider.dart';
import 'package:my_wallet/ui/features/auth/presentation/mappers/wellcome_mapper.dart';
import 'package:provider/provider.dart';

import '../../../../design_system/organisms/loading.dart';
import '../../../../design_system/organisms/loading_screen.dart';
import '../../../../helpers/message_helper.dart';
import '../args/wellcome_args.dart';
import '../interface/wellcome_interface.dart';
import '../models/wellcome_model_ui.dart';
import '../presenters/wellcome_presenter.dart';

class WellcomeScreen extends StatefulWidget {
  static const String routeName = '/wellcome';
  final WellcomeArgs args;

  const WellcomeScreen({super.key, required this.args});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen>
    implements WelcomeInterface {
  late WellcomePresenter _presenter;
  late WellcomeModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        if (languageProvider.isLoading) {
          return const LoadingScreen();
        }

        _model = WellcomeMapper().fromMap(
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
            child: Column(
              children: [
                const SizedBox(height: 150),
                const FlutterLogo(size: 150),
                const SizedBox(height: 50),
                Text(
                  _model.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _presenter.signWithGoogle(),
                            icon: SvgPicture.asset(
                              'assets/icons/google.svg',
                              width: 30,
                              colorFilter: ColorFilter.mode(
                                Colors.blue,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          _model.labelGoogle,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () => widget
                                .args.onNewAccountPressed
                                .call(),
                            icon: const Icon(
                              Icons.person_add_alt_1_outlined,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                          _model.labelNewAccount,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Colors.white,
                  onPressed: () => widget.args.onLoginPressed.call(),
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: Center(
                      child: Text(
                        _model.singInBtnLabel,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _model.policyText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _loading = Loading();
    _presenter = WellcomePresenter(this, widget.args);
    super.initState();
  }

  @override
  void showErrorMessage(String message) {
    MessageHelper.showSnackBar(
      context,
      message: message,
      isError: true,
    );
  }

  @override
  void hideLoading() {
    _loading.hide();
  }

  @override
  void showLoading() {
    _loading.show(context);
  }

  @override
  void signSuccess() {}
}
