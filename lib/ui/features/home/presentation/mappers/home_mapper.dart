import 'package:my_wallet/ui/features/home/presentation/models/home_model_ui.dart';

import '../../../../../domain/mappers/base_mapper.dart';

class HomeMapper extends Mapper<HomeModelUi> {
  @override
  HomeModelUi fromMap(Map<String, dynamic> json) {
    return HomeModelUi(
      appbar: AppBarHome(
        greeting: json['appbar']['greeting'],
        avatar: json['appbar']['greeting'],
      ),
      newPocketLabel: json['newPocketLabel'],
      incomesLabel: json['incomesLabel'],
      expensesLabel: json['expensesLabel'],
      currentBalance: json['currentBalance'],
      categoryExpenses: json['categoryExpenses'],
      categoryIncomes: json['categoryIncomes'],
      latestRecords: json['latestRecords'],
    );
  }

  @override
  Map<String, dynamic>? toMap(HomeModelUi data) {
    return {
      'appBar': data.appbar,
      'newPocketLabel': data.newPocketLabel,
      'incomesLabel': data.incomesLabel,
      'expensesLabel': data.expensesLabel,
      'currentBalance': data.currentBalance,
      'categoryExpenses': data.categoryExpenses,
      'categoryIncomes': data.categoryIncomes,
      'latestRecords': data.latestRecords,
    };
  }
}
