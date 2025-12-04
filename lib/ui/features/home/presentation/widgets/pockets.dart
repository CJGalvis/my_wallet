import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/domain/providers/theme_provider.dart';

import '../../../../design_system/design_system.dart';
import '../../domain/models/pocket_model.dart';
import '../helpers/constants.dart';
import '../helpers/format_helper.dart';
import '../providers/pockets_cloud_provider.dart';
import 'widgets.dart';

class Pockets extends ConsumerWidget {
  final String labelNewPocket;
  final ValueChanged<Pocket> onPressedPocket;
  final VoidCallback onPressedNewPocket;

  const Pockets({
    super.key,
    required this.labelNewPocket,
    required this.onPressedPocket,
    required this.onPressedNewPocket,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketAsync = ref.watch(pocketsCloudProvider);

    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);

    return pocketAsync.when(
      loading: () => Container(
        decoration: Decorations.pocketBackgroundDecorations(isDark),
        width: double.infinity,
        height: 120,
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, _) => Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_balance_wallet, size: 50),
                Text('Error al cargar tus bolsillos'),
              ],
            ),
          ),
        ),
      ),
      data: (pockets) {
        final int length = pockets.length >= maxPockets
            ? pockets.length
            : pockets.length + 1;

        return Container(
          decoration: Decorations.pocketBackgroundDecorations(isDark),
          width: double.infinity,
          height: 120,
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

class PocketItem extends ConsumerWidget {
  final Pocket model;
  final ValueChanged<Pocket> onPressed;

  const PocketItem({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.read(themeAppProvider.notifier).isDark(context);

    return GestureDetector(
      onTap: () => onPressed.call(model),
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
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
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
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
