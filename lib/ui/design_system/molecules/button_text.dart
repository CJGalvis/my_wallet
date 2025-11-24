import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/design_system/theme/theme.dart';

import '../../../domain/providers/providers.dart';
import '../tokens/tokens.dart';

class ButtonText extends ConsumerWidget {
  const ButtonText({
    super.key,
    required this.callback,
    required this.label,
  });

  final String label;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);
        
    return TextButton(
      onPressed: callback,
      child: Text(
        label,
        style: TextStyle(
          fontSize: labelButtonTextSize,
          color: isDark ?Colors.white: primaryTextColor,
        ),
      ),
    );
  }
}
