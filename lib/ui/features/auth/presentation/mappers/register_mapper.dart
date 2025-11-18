import '../../../../../domain/mappers/base_mapper.dart';
import '../models/register_model_ui.dart';

class RegisterMapper extends Mapper<RegisterModelUi> {
  @override
  RegisterModelUi fromMap(Map<String, dynamic> json) {
    return RegisterModelUi(
      title: json['title'],
      texthintUsername: json['texthintUsername'],
      texthintEmail: json['texthintEmail'],
      texthintPassword: json['texthintPassword'],
      labelUsername: json['labelUsername'],
      labelEmail: json['labelEmail'],
      labelPassword: json['labelPassword'],
      textMessageError: json['textMessageError'],
      singInBtnLabel: json['singInBtnLabel'],
      singUpBtnLabel: json['singUpBtnLabel'],
      textErrorEmail: json['textErrorEmail'],
      textErrorPassword: json['textErrorPassword'],
      textErrorUsername: json['textErrorUsername'],
    );
  }

  @override
  Map<String, dynamic>? toMap(RegisterModelUi data) {
    return {
      'title': data.title,
      'texthintUsername': data.labelUsername,
      'texthintEmail': data.texthintEmail,
      'texthintPassword': data.texthintPassword,
      'labelEmail': data.labelEmail,
      'labelabelUsernamelEmail': data.labelUsername,
      'labelPassword': data.labelPassword,
      'textMessageError': data.textMessageError,
      'singInBtnLabel': data.singInBtnLabel,
      'singUpBtnLabel': data.singUpBtnLabel,
      'textErrorPassword': data.textErrorPassword,
      'textErrorEmail': data.textErrorEmail,
      'textErrorUsername': data.textErrorUsername,
    };
  }
}
