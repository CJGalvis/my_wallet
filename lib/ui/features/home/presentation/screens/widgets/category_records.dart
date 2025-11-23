import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/ui/features/home/presentation/providers/expenses_category_provider.dart';

import '../../../../../design_system/molecules/molecules.dart';

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withValues(alpha: 0.3),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleFeed(title: title),
              Divider(color: Colors.white70),
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
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      expense.pocket,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    trailing: FittedBox(
                      child: Text(
                        '\$${expense.balance}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
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
