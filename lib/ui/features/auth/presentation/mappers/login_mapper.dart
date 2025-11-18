import '../../../../../domain/mappers/base_mapper.dart';
import '../models/login_model_ui.dart';

class LoginMapper extends Mapper<LoginModelUi> {
  @override
  LoginModelUi fromMap(Map<String, dynamic> json) {
    return LoginModelUi(
      title: json['title'],
      subtitle: json['subtitle'],
      texthintEmail: json['texthintEmail'],
      texthintPassword: json['texthintPassword'],
      labelEmail: json['labelEmail'],
      labelPassword: json['labelPassword'],
      textMessageError: json['textMessageError'],
      singInBtnLabel: json['singInBtnLabel'],
      singUpBtnLabel: json['singUpBtnLabel'],
      forgotPasswordLabel: json['forgotPasswordLabel'],
      textErrorEmail: json['textErrorEmail'],
      textErrorPassword: json['textErrorPassword'],
    );
  }

  @override
  Map<String, dynamic>? toMap(LoginModelUi data) {
    return {
      'title': data.title,
      'subtitle': data.subtitle,
      'texthintEmail': data.texthintEmail,
      'texthintPassword': data.texthintPassword,
      'labelEmail': data.labelEmail,
      'labelPassword': data.labelPassword,
      'textMessageError': data.textMessageError,
      'singInBtnLabel': data.singInBtnLabel,
      'singUpBtnLabel': data.singUpBtnLabel,
      'forgotPasswordLabel': data.forgotPasswordLabel,
      'textErrorPassword': data.textErrorPassword,
      'textErrorEmail': data.textErrorEmail,
    };
  }
}
