import 'package:flutter/foundation.dart';

class AuthCheckArgs {
  final VoidCallback checkSuccess;
  final VoidCallback checkError;

  AuthCheckArgs({
    required this.checkSuccess,
    required this.checkError,
  });
}
