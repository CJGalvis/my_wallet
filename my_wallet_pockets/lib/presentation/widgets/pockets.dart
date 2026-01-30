import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';

import '../helpers/constants.dart';
import '../providers/pockets_provider.dart';
import 'new_pocket.dart';

class Pockets extends ConsumerWidget {
  final String labelNewPocket;
  final String textErrorLoadPockets;
  final ValueChanged<Pocket> onPressedPocket;
  final VoidCallback onPressedNewPocket;

  const Pockets({
    super.key,
    required this.labelNewPocket,
    required this.textErrorLoadPockets,
    required this.onPressedPocket,
    required this.onPressedNewPocket,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketsNotifier = ref.watch(pocketsProvider);

    return pocketsNotifier.when(
      loading: () => PocketsContainer(
        child: Center(child: CircularProgressIndicator.adaptive()),
      ),
      error: (error, _) => PocketsContainer(
        child: DisplayInfo(
          textDisplay: textErrorLoadPockets,
        ),
      ),
      data: (pockets) {
        final int length = pockets.length >= maxPockets
            ? pockets.length
            : pockets.length + 1;

        return PocketsContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: length,
                itemBuilder: (context, index) {
                  if (index == pockets.length &&
                      pockets.length < maxPockets) {
                    return Row(
                      children: [
                        NewPocket(
                          label: labelNewPocket,
                          onPressed: onPressedNewPocket,
                        ),
                        const SizedBox(width: 50),
                      ],
                    );
                  }

                  final pocket = pockets[index];
                  return PocketItem(
                    model: pocket,
                    onPressed: onPressedPocket,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class PocketsContainer extends ConsumerWidget {
  final Widget child;

  const PocketsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.read(themeProvider.notifier).isDark(context);

    return Container(
      decoration: Decorations.pocketBackgroundDecorations(isDark),
      width: double.infinity,
      height: 120,
      child: child,
    );
  }
}

class PocketItem extends ConsumerWidget {
  final Pocket model;
  final ValueChanged<Pocket>? onPressed;

  const PocketItem({super.key, required this.model, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.read(themeProvider.notifier).isDark(context);

    return GestureDetector(
      onTap: () => onPressed?.call(model),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDark
                ? Theme.of(context).primaryColorDark
                : Colors.white,
          ),
          width: 130,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PocketIcon(Icons.wallet_outlined),
                _PocketName(model.name),
                _PocketBalance(model.balance),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PocketBalance extends StatelessWidget {
  final double balance;
  const _PocketBalance(this.balance);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        '\$ ${FormatHelper.currency(balance)}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _PocketName extends StatelessWidget {
  final String name;
  const _PocketName(this.name);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class _PocketIcon extends StatelessWidget {
  final IconData icon;
  const _PocketIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.blueAccent,
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
