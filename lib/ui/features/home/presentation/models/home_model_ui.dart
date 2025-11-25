class HomeModelUi {
  final AppBarHome appBar;
  final String newPocketLabel;
  final String incomesLabel;
  final String expensesLabel;
  final String currentBalance;
  final String categoryExpenses;
  final String descriptionIncomes;
  final String descriptionExpenses;
  final String latestRecords;
  final String labelShowMore;
  final String latestRecordsEmpty;

  HomeModelUi({
    required this.appBar,
    required this.newPocketLabel,
    required this.incomesLabel,
    required this.expensesLabel,
    required this.currentBalance,
    required this.categoryExpenses,
    required this.descriptionIncomes,
    required this.descriptionExpenses,
    required this.latestRecords,
    required this.labelShowMore,
    required this.latestRecordsEmpty,
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
