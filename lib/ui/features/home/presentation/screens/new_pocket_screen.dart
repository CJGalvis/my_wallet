import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/ui/features/home/presentation/interfaces/new_pocket_interface.dart';
import 'package:my_wallet/ui/features/home/presentation/presenters/new_pocket_presenter.dart';

import '../../../../../domain/providers/providers.dart';
import '../../../../design_system/design_system.dart';
import '../../../../helpers/message_helper.dart';
import '../../domain/models/pocket_type.dart';
import '../args/new_pocket_args.dart';
import '../helpers/format_helper.dart';
import '../mappers/new_pocket_mapper.dart';
import '../models/new_pocket_model_ui.dart';
import '../providers/providers.dart';

//ToDo: agrear formulario y validacion

class NewPocketScreen extends ConsumerStatefulWidget {
  static const String routeName = '/new-pocket';
  final NewPocketArgs args;

  const NewPocketScreen({super.key, required this.args});

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
    _loading = Loading();
    super.initState();
  }

  @override
  void createdSuccess() {
    widget.args.createdSuccess.call();
  }

  @override
  void showLoading() => _loading.show(context);

  @override
  void hideLoading() => _loading.hide();

  @override
  void showError(String message) {
    MessageHelper.showSnackBar(
      context,
      message: message,
      isError: true,
    );
  }
}

class NewPocketView extends ConsumerWidget {
  final NewPocketModelUi model;
  final NewPocketArgs args;
  final NewPocketPresenter presenter;

  const NewPocketView(
      {super.key,
      required this.model,
      required this.args,
      required this.presenter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerType = TextEditingController(
      text: '',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(model.appBarTitle),
        leading: IconButton(
          onPressed: () {
            context.pop();
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
              CustomInput(
                readOnly: true,
                controller: controllerType,
                onTap: () => _openBottomSheet(context, ref, model),
                prefixIcon: Icons.payments_outlined,
                onChanged: (value) {},
                texthint: model.typePocketInput.textHint,
                label: model.typePocketInput.label,
              ),
              SizedBox(height: sizeBox20),
              CustomInput(
                prefixIcon: Icons.text_fields,
                onChanged:
                    ref.read(newPocketProvider.notifier).setName,
                texthint: model.namePocketInput.textHint,
                label: model.namePocketInput.label,
              ),
              SizedBox(height: sizeBox20),
              CustomInputBalance(
                keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                prefixIcon: Icons.attach_money_outlined,
                onChanged: (value) => _onChangeBalance(value, ref),
                texthint: model.balancePocketInput.textHint,
                label: model.balancePocketInput.label,
              ),
              SizedBox(height: sizeBox20),
              ButtonPrimary(
                callback: () {
                  presenter.createPocket();
                },
                label: model.btnSave,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeBalance(String value, WidgetRef ref) {
    final clean = toNumericString(value, allowPeriod: true);
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
                    PocketType(
                      icon: Icons.account_balance,
                      name: model.typePocketOptions[0],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text(model.typePocketOptions[1]),
                  onTap: () => _selectPocketType(
                    ref,
                    context,
                    PocketType(
                      icon: Icons.credit_card,
                      name: model.typePocketOptions[2],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text(model.typePocketOptions[2]),
                  onTap: () => _selectPocketType(
                    ref,
                    context,
                    PocketType(
                      icon: Icons.money,
                      name: model.typePocketOptions[2],
                    ),
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
    PocketType type,
  ) {
    ref.read(newPocketProvider.notifier).setType(
          PocketType(
            icon: type.icon,
            name: type.name,
          ),
        );
    context.pop();
  }
}

class PocketPreview extends ConsumerWidget {
  const PocketPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);
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
                    newPocket.type.icon,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
