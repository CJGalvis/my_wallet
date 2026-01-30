import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

class NewPocket extends ConsumerWidget {
  final String label;
  final VoidCallback onPressed;

  const NewPocket({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeProvider.notifier).isDark(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 130,
            color: isDark
                ? Theme.of(context).primaryColorDark
                : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: isDark
                        ? Colors.white
                        : Colors.blueGrey,
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
