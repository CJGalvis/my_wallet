import 'package:flutter/material.dart';

import '../../config/auth_config.dart';

class LoginArgs {
  final String language;
  final AuthConfig config;
  final VoidCallback onLoginSuccess;
  final VoidCallback onNewAccount;
  final ValueChanged<String>? onLoginError;

  LoginArgs({
    required this.language,
    required this.config,
    required this.onLoginSuccess,
    required this.onNewAccount,
    this.onLoginError,
  });
}
