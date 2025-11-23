import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/expense_category.dart';

part 'expenses_category_provider.g.dart';

@riverpod
class ExpensesCategoryNotifier extends _$ExpensesCategoryNotifier {
  @override
  List<ExpenseCategory> build() {
    return [
      ExpenseCategory(
        balance: 150000,
        category: 'Vehiculo',
        pocket: 'Nequi',
      ),
      ExpenseCategory(
        balance: 100000,
        category: 'Mercado',
        pocket: 'Efectivo',
      ),
      ExpenseCategory(
        balance: 50000,
        category: 'Macota',
        pocket: 'Nequi',
      ),
    ];
  }
}
