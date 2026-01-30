import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import '../args/new_pocket_args.dart';
import '../interfaces/new_pocket_interface.dart';
import '../mappers/new_pocket_mapper.dart';
import '../models/new_pocket_model_ui.dart';
import '../presenters/new_pocket_presenter.dart';
import '../providers/providers.dart';

class NewPocketScreen extends ConsumerStatefulWidget {
  static const String routeName = '/new-pocket';
  final NewPocketArgs args;

  const NewPocketScreen({
    super.key,
    required this.args,
  });

  @override
  ConsumerState<NewPocketScreen> createState() =>
      _NewPocketScreenState();
}

class _NewPocketScreenState extends ConsumerState<NewPocketScreen>
    implements NewPocketInterface {
  late NewPocketPresenter _presenter;
  late NewPocketModelUi _model;
  late Loading _loading;

  @override
  Widget build(BuildContext context) {
    final asyncLabels = ref.watch(languageProvider);

    return asyncLabels.when(
      loading: () => LoadingScreen(),
      error: (error, stackTrace) => ErrorScreen(),
      data: (labelsMap) {
        _model = NewPocketMapper().fromMap(
          labelsMap[widget.args.language]!,
        );

        return NewPocketView(
          presenter: _presenter,
          args: widget.args,
          model: _model,
        );
      },
    );
  }

  @override
  void initState() {
    _presenter = NewPocketPresenter(this, widget.args);
    _loading = Loading(context);
    super.initState();
  }

  @override
  void createdSuccess() {
    widget.args.createdSuccess.call();
  }

  @override
  void showLoading() => _loading.show();

  @override
  void hideLoading() => _loading.hide();

  @override
  void showError(ErrorItem error) {
    MessageHelper.showSnackBar(
      context,
      message: error.description,
      isError: true,
    );
  }
}

class NewPocketView extends ConsumerWidget {
  final NewPocketModelUi model;
  final NewPocketArgs args;
  final NewPocketPresenter presenter;

  const NewPocketView({
    super.key,
    required this.model,
    required this.args,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPocket = ref.watch(newPocketProvider);
    final controllerType = TextEditingController(
      text: newPocket.type,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(model.appBarTitle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              PocketPreview(),
              SizedBox(height: sizeBox20),
              Form(
                key: presenter.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomInput(
                      readOnly: true,
                      controller: controllerType,
                      onTap: () =>
                          _openBottomSheet(context, ref, model),
                      prefixIcon: Icons.payments_outlined,
                      onChanged: (value) {},
                      texthint: model.typePocketInput.textHint,
                      label: model.typePocketInput.label,
                      validator: (value) =>
                          FormValidators.minLength(
                            value,
                            minValueLengthPocket,
                          )
                          ? null
                          : 'Debe seleccionar un tipo',
                    ),
                    SizedBox(height: sizeBox20),
                    CustomInput(
                      prefixIcon: Icons.text_fields,
                      onChanged: ref
                          .read(newPocketProvider.notifier)
                          .setName,
                      texthint: model.namePocketInput.textHint,
                      label: model.namePocketInput.label,
                      validator: (value) =>
                          FormValidators.minLength(
                            value,
                            minValueLengthPocket,
                          )
                          ? null
                          : 'Mínimo 3 caracteres',
                    ),
                    SizedBox(height: sizeBox20),
                    CustomInputBalance(
                      texthint: model.balancePocketInput.textHint,
                      label: model.balancePocketInput.label,
                      prefixIcon: Icons.attach_money_outlined,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      onChanged: (value) =>
                          _onChangeBalance(value, ref),
                    ),
                    SizedBox(height: sizeBox20),
                    ButtonPrimary(
                      label: model.btnSave,
                      callback: () {
                        FocusScope.of(context).unfocus();
                        if (!presenter.isValidForm()) return;
                        presenter.createPocket(ref, newPocket);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeBalance(String value, WidgetRef ref) {
    final clean = FormValidators.toNumString(value);
    final amount = double.tryParse(clean) ?? 0.0;

    ref.read(newPocketProvider.notifier).setBalance(amount);
  }

  Future<void> _openBottomSheet(
    BuildContext context,
    WidgetRef ref,
    NewPocketModelUi model,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text(model.typePocketOptions[0]),
                  onTap: () => _selectPocketType(
                    ref,
                    context,
                    model.typePocketOptions[0],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text(model.typePocketOptions[1]),
                  onTap: () => _selectPocketType(
                    ref,
                    context,
                    model.typePocketOptions[1],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text(model.typePocketOptions[2]),
                  onTap: () => _selectPocketType(
                    ref,
                    context,
                    model.typePocketOptions[2],
                  ),
                ),
              ],
            ).toList(),
          ),
        );
      },
    );
  }

  void _selectPocketType(
    WidgetRef ref,
    BuildContext context,
    String type,
  ) {
    ref.read(newPocketProvider.notifier).setType(type);
    Navigator.pop(context);
  }
}

class PocketPreview extends ConsumerWidget {
  const PocketPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref
        .read(themeProvider.notifier)
        .isDark(context);
    final newPocket = ref.watch(newPocketProvider);

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 130,
          color: isDark
              ? Theme.of(context).primaryColorDark
              : Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueAccent,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.wallet_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    newPocket.name.isNotEmpty
                        ? newPocket.name
                        : '...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '\$ ${FormatHelper.currency(newPocket.balance)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
