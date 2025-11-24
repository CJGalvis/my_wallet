import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/providers/providers.dart';
import '../tokens/tokens.dart';

class ButtonCircular extends ConsumerWidget {
  const ButtonCircular({
    super.key,
    required this.bottomLabel,
    required this.callback,
    required this.icon,
  });

  final String bottomLabel;
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);

    return Column(
      children: [
        Container(
          width: radiusButtonCircular,
          height: radiusButtonCircular,
          decoration: BoxDecoration(
            color: isDark
                ? Theme.of(context).highlightColor
                : Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: callback,
            icon: Icon(
              icon,
              size: iconButtonCircularSize,
            ),
          ),
        ),
        Text(
          bottomLabel,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
