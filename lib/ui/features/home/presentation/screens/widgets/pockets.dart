import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';
import 'package:my_wallet/ui/features/home/presentation/helpers/format_helper.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/pockets_provider.dart';

import '../../helpers/constants.dart';
import 'widgets.dart';

class Pockets extends ConsumerWidget {
  const Pockets({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pockets = ref.watch(pocketProvider);

    final int length = pockets.length >= maxPockets
        ? pockets.length
        : pockets.length + 1;

    return Container(
      color: Colors.indigoAccent.shade200,
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (context, index) {
              if (index == pockets.length &&
                  pockets.length < maxPockets) {
                return Row(
                  children: [
                    NewPocket(),
                    const SizedBox(width: 50),
                  ],
                );
              }

              final pocket = pockets[index];
              return PocketItem(model: pocket);
            },
          ),
        ),
      ),
    );
  }
}

class PocketItem extends StatelessWidget {
  final Pocket model;

  const PocketItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 130,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PocketIcon(model.icon),
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
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
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
