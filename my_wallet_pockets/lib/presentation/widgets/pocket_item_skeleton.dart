import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import 'pockets_container.dart';

class PocketItemSkeleton extends ConsumerWidget {
  const PocketItemSkeleton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PocketsContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsGeometry.only(left: 8),
                child: SkeletonLoader(width: 130, height: 50),
              );
            },
          ),
        ),
      ),
    );
  }
}
