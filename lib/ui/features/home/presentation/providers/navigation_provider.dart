import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() => 0;

  void changeTab(int index, BuildContext context) {
    state = index;
  }
}
