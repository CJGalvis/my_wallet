
import 'package:my_wallet_core/my_wallet_core.dart';

import '../models/input_model_ui.dart';


class InputUiMapper extends Mapper<InputModelUI> {
  @override
  InputModelUI fromMap(Map<String, dynamic> json) {
    return InputModelUI(
      label: json['label'],
      textHint: json['textHint'],
      maxLength: json['maxLength'],
    );
  }

  @override
  Map<String, dynamic>? toMap(InputModelUI data) {
    return {
      'label': data.label,
      'textHint': data.textHint,
      'maxLength': data.maxLength,
    };
  }
}
