import 'package:expenses/components.dart';
import 'package:expenses/expensesItem.dart';
import 'package:flutter/material.dart';

class expensesList extends StatelessWidget {
  const expensesList({
    super.key,
    required this.expense,
    required this.ondelete,
  });

  final List<Expense> expense;
  final void Function(Expense ex) ondelete;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expense.length,
          itemBuilder: (context, index) => Dismissible(
                key: ValueKey(expense[index]),
                onDismissed: (direction) => ondelete(expense[index]),
                child: expensesItem(
                  expense: expense[index],
                ),
              )),
    );
  }
}
//dismissible قابل للسحب