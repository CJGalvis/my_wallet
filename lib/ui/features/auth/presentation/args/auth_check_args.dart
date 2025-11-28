import 'package:flutter/foundation.dart';

class AuthCheckArgs {
  final String language;
  final VoidCallback checkSuccess;
  final VoidCallback checkError;

  AuthCheckArgs({
    required this.language,
    required this.checkSuccess,
    required this.checkError,
  });
}
