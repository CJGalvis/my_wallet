import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/domain/providers/providers.dart';

import '../tokens/tokens.dart';

class ButtonPrimary extends ConsumerWidget {
  const ButtonPrimary({
    super.key,
    this.callback,
    required this.label,
  });

  final VoidCallback? callback;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusCircular),
      ),
      color: isDark
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColorLight,
      onPressed: callback,
      child: SizedBox(
        width: double.infinity,
        height: buttonHeight,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: labelButtonSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
