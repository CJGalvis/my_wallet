class HomeModelUi {
  final AppBarHome appbar;
  final String newPocketLabel;
  final String incomesLabel;
  final String expensesLabel;
  final String currentBalance;
  final String categoryExpenses;
  final String categoryIncomes;
  final String latestRecords;

  HomeModelUi({
    required this.appbar,
    required this.newPocketLabel,
    required this.incomesLabel,
    required this.expensesLabel,
    required this.currentBalance,
    required this.categoryExpenses,
    required this.categoryIncomes,
    required this.latestRecords,
  });
}

class AppBarHome {
  final String greeting;
  final String avatar;

  AppBarHome({
    required this.greeting,
    required this.avatar,
  });
}
