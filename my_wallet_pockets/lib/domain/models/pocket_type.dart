import 'package:flutter/material.dart';

class PocketType {
  final IconData icon;
  final String name;

  PocketType({required this.icon, required this.name});

  factory PocketType.initial() => PocketType(
        icon: Icons.abc,
        name: '',
      );
}
