import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/providers/theme_provider.dart';
import '../tokens/tokens.dart';

class ButtonCircularSVG extends ConsumerWidget {
  const ButtonCircularSVG({
    super.key,
    required this.bottomLabel,
    required this.callback,
    required this.path,
  });

  final String bottomLabel;
  final VoidCallback callback;
  final String path;

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
            icon: SvgPicture.asset(
              path,
              width: iconButtonCircularSize,
              colorFilter: ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
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
