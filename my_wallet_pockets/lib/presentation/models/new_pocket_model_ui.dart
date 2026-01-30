import 'input_model_ui.dart';

class NewPocketModelUi {
  final String appBarTitle;
  final InputModelUI typePocketInput;
  final InputModelUI namePocketInput;
  final InputModelUI balancePocketInput;
  final List<String> typePocketOptions;
  final String btnSave;

  NewPocketModelUi({
    required this.appBarTitle,
    required this.typePocketInput,
    required this.namePocketInput,
    required this.balancePocketInput,
    required this.typePocketOptions,
    required this.btnSave,
  });
}
