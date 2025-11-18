import 'constans.dart';

class FormValidators {
  static bool emailValidator(String value) {
    RegExp regExp = RegExp(patternEmail);

    return regExp.hasMatch(value);
  }

  static bool minLength(String? value, int min) {
    return (value != null && value.length >= min);
  }

  static bool textValidator(String value) {
    RegExp regExp = RegExp(patterLetters);

    return regExp.hasMatch(value);
  }
}
