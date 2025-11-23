import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/pocket_model.dart';

part 'pockets_provider.g.dart';

@Riverpod(keepAlive: true)
class PocketNotifier extends _$PocketNotifier {
  @override
  List<Pocket> build() {
    return [
      Pocket(
        icon: Icons.blinds_closed,
        name: 'Nequi',
        balance: 50000,
      ),
      Pocket(
        icon: Icons.account_balance,
        name: 'Bancolombia',
        balance: 200000,
      ),
      Pocket(
        icon: Icons.money,
        name: 'Efectivo',
        balance: 33500,
      ),
    ];
  }
}
