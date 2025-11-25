import 'dart:ui';

import 'package:my_wallet/ui/features/home/config/new_pocket_config.dart';

class NewPocketArgs {
  final String language;
  final VoidCallback createdSuccess;
  final NewPocketConfig config;

  NewPocketArgs({
    required this.language,
    required this.createdSuccess,
    required this.config,
  });
}
