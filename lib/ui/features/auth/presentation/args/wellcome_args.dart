import 'package:flutter/material.dart';

import '../../config/auth_config.dart';

class WellcomeArgs {
  final String language;
  final AuthConfig config;
  final VoidCallback onLoginPressed;
  final VoidCallback onGoogleAccountPressed;
  final VoidCallback onNewAccountPressed;
  final VoidCallback onGoogleAuthSuccess;

  WellcomeArgs({
    required this.language,
    required this.config,
    required this.onLoginPressed,
    required this.onGoogleAccountPressed,
    required this.onNewAccountPressed,
    required this.onGoogleAuthSuccess,
  });
}
