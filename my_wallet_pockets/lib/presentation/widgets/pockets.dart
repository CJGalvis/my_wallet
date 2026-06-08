import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_pockets/config/config.dart';
import 'package:my_wallet_pockets/domain/models/pocket_model.dart';
import 'package:my_wallet_pockets/presentation/interfaces/pockets_interface.dart';
import 'package:my_wallet_pockets/presentation/presenters/pockets_presenter.dart';
import 'package:my_wallet_pockets/presentation/widgets/pockets_container.dart';

import '../helpers/constants.dart';
import '../providers/pockets_provider.dart';
import 'new_pocket.dart';
import 'pocket_item.dart';
import 'pocket_item_skeleton.dart';

class Pockets extends ConsumerStatefulWidget {
  final String labelNewPocket;
  final String textErrorLoadPockets;
  final ValueChanged<Pocket> onPressedPocket;
  final VoidCallback onPressedNewPocket;
  final PocketsConfig config;

  const Pockets({
    super.key,
    required this.labelNewPocket,
    required this.textErrorLoadPockets,
    required this.onPressedPocket,
    required this.onPressedNewPocket,
    required this.config,
  });

  @override
  ConsumerState<Pockets> createState() => _PocketsState();
}

class _PocketsState extends ConsumerState<Pockets>
    implements PocketsInterface {
  late final PocketsPresenter _presenter;

  @override
  Widget build(BuildContext context) {
    final pocketsNotifier = ref.watch(pocketsProvider);

    return pocketsNotifier.when(
      loading: () => PocketItemSkeleton(),
      error: (_, _) => PocketsContainer(
        child: DisplayInfo(textDisplay: widget.textErrorLoadPockets),
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
                          label: widget.labelNewPocket,
                          onPressed: widget.onPressedNewPocket,
                        ),
                        const SizedBox(width: 50),
                      ],
                    );
                  }

                  final pocket = pockets[index];
                  return PocketItem(
                    model: pocket,
                    onPressed: widget.onPressedPocket,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _presenter = PocketsPresenter(this, widget.config);
    _presenter.getPockets();
  }

  @override
  void showError(ErrorItem error) {
    MessageHelper.showSnackBar(
      context,
      message: error.description,
      isError: true,
    );
  }

  @override
  void updateData(List<Pocket> pockets) {
    if (!mounted) return;
    ref.read(pocketsProvider.notifier).loadPockets(pockets);
  }
}
