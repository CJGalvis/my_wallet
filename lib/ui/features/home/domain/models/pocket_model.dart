import 'package:flutter/material.dart';

class Pocket {
  final IconData icon;
  final String name;
  final double balance;

  Pocket({
    required this.icon,
    required this.name,
    required this.balance,
  });

  factory Pocket.initial() => Pocket(
        icon: Icons.blinds_closed,
        name: '',
        balance: 0,
      );

  Pocket copyWith({
    IconData? icon,
    String? name,
    double? balance,
  }) {
    return Pocket(
      icon: icon ?? this.icon,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }
}
