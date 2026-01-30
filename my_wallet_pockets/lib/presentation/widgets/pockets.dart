import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'package:my_wallet_pockets/presentation/widgets/pockets_container.dart';

import '../helpers/constants.dart';
import '../providers/pockets_provider.dart';
import 'new_pocket.dart';
import 'pocket_item.dart';
import 'pocket_item_skeleton.dart';

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
      loading: () => PocketItemSkeleton(),
      error: (_, _) => PocketsContainer(
        child: DisplayInfo(textDisplay: textErrorLoadPockets),
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
