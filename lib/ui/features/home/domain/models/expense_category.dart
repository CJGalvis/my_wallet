class ExpenseCategory {
  final String category;
  final String pocket;
  final double balance;

  ExpenseCategory({
    required this.category,
    required this.pocket,
    required this.balance,
  });

  factory ExpenseCategory.initial() => ExpenseCategory(
        category: '',
        pocket: '',
        balance: 0,
      );

  ExpenseCategory copyWith({
    String? category,
    String? pocket,
    double? balance,
  }) {
    return ExpenseCategory(
      category: category ?? this.category,
      pocket: pocket ?? this.pocket,
      balance: balance ?? this.balance,
    );
  }
}
