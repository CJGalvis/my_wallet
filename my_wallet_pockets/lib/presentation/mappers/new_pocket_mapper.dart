import 'package:my_wallet_core/my_wallet_core.dart';

import '../models/new_pocket_model_ui.dart';
import 'input_ui_mapper.dart';

class NewPocketMapper extends Mapper<NewPocketModelUi> {
  @override
  NewPocketModelUi fromMap(Map<String, dynamic> json) {
    return NewPocketModelUi(
      appBarTitle: json['appBarTitle'],
      typePocketInput: InputUiMapper().fromMap(
        json['typePocketInput'],
      ),
      namePocketInput: InputUiMapper().fromMap(
        json['namePocketInput'],
      ),
      balancePocketInput: InputUiMapper().fromMap(
        json['balancePocketInput'],
      ),
      btnSave: json['btnSave'],
      typePocketOptions: List.from(json['typePocketOptions']),
    );
  }

  @override
  Map<String, dynamic>? toMap(NewPocketModelUi data) {
    return {
      'appBarTitle': data.appBarTitle,
      'typePocketInput': data.typePocketInput,
      'namePocketInput': data.namePocketInput,
      'balancePocketInput': data.balancePocketInput,
      'btnSave': data.btnSave,
      'typePocketOptions': data.typePocketOptions,
    };
  }
}
