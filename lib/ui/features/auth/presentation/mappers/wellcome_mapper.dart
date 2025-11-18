import '../../../../../domain/mappers/base_mapper.dart';
import '../models/wellcome_model_ui.dart';

class WellcomeMapper extends Mapper<WellcomeModelUi> {
  @override
  WellcomeModelUi fromMap(Map<String, dynamic> json) {
    return WellcomeModelUi(
      title: json['title'],
      singInBtnLabel: json['singInBtnLabel'],
      policyText: json['policyText'],
      labelGoogle: json['labelGoogle'],
      labelNewAccount: json['labelNewAccount'],
    );
  }

  @override
  Map<String, dynamic>? toMap(WellcomeModelUi data) {
    return {
      'title': data.title,
      'singInBtnLabel': data.singInBtnLabel,
      'policyText': data.policyText,
      'labelGoogle': data.labelGoogle,
      'labelNewAccount': data.labelNewAccount,
    };
  }
}
