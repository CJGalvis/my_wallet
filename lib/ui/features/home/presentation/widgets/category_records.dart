import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../design_system/design_system.dart';
import '../providers/expenses_category_provider.dart';
import 'widgets.dart';

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
                  return ItemRecord(
                    record: expensesCategory[index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
