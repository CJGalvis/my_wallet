import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expenses_provider.g.dart';

@riverpod
double expenses(Ref ref) {
  return 250000;
}