import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../design_system/design_system.dart';
import '../helpers/format_helper.dart';
import '../providers/expenses_category_provider.dart';

class RecordsCategories extends ConsumerWidget {
  const RecordsCategories({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesCategory = ref.watch(expensesCategoryProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: Decorations.cardsDecorations(),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFeed(title: title),
              Divider(color: primaryTextColor),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: expensesCategory.length,
                itemBuilder: (context, index) {
                  final expense = expensesCategory[index];

                  return ListTile(
                    title: Text(
                      expense.category,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                      ),
                    ),
                    subtitle: Text(
                      expense.pocket,
                      style: TextStyle(
                        color: primaryTextColor,
                      ),
                    ),
                    trailing: FittedBox(
                      child: Text(
                        '\$ ${FormatHelper.currency(expense.balance)}',
                        style: TextStyle(
                          fontSize: fontSizeSubtitle,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
