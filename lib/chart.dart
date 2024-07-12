import 'package:expenses/chartbar.dart';
import 'package:expenses/components.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  const chart({super.key, required this.expenses});
  final List<Expense> expenses;
  List<ExpensesBucket> get bucket {
    return [
      ExpensesBucket.forcategory(Category.food, expenses),
      ExpensesBucket.forcategory(Category.work, expenses),
      ExpensesBucket.forcategory(Category.travel, expenses),
      ExpensesBucket.forcategory(Category.leisure, expenses),
    ];
  }

  get maxtotalexpense {
    double maxtotalexpense = 0;
    for (var element in bucket) {
      if (element.totalexpenses > maxtotalexpense) {
        maxtotalexpense = element.totalexpenses;
      }
    }
    return maxtotalexpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 175,
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final e in bucket)
                chartbar(
                  fill: e.totalexpenses == 0
                      ? 0
                      : e.totalexpenses / maxtotalexpense,
                ),
            ],
          )),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: bucket
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        categIcon[e.category],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
