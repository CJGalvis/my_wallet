import 'dart:ui';

import 'package:my_wallet_pockets/config/pockets_config.dart';


class NewPocketArgs {
  final String language;
  final VoidCallback createdSuccess;
  final PocketsConfig config;

  NewPocketArgs({
    required this.language,
    required this.createdSuccess,
    required this.config,
  });
}
