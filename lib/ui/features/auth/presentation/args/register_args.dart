import 'package:flutter/material.dart';

import '../../config/auth_config.dart';

class RegisterArgs {
  final String language;
  final AuthConfig config;
  final VoidCallback onRegisterSuccess;
  final VoidCallback onAlreadyAccount;
  final ValueChanged<String>? onRegisterError;

  RegisterArgs({
    required this.language,
    required this.config,
    required this.onRegisterSuccess,
    required this.onAlreadyAccount,
    this.onRegisterError,
  });
}
