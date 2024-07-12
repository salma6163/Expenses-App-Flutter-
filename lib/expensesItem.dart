import 'package:expenses/components.dart';
import 'package:flutter/material.dart';

class expensesItem extends StatelessWidget {
  const expensesItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(categIcon[expense.category]),
                const SizedBox(
                  width: 0,
                ),
                Text(
                  expense.Format(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
