import 'package:expenses/ExpensesList.dart';
import 'package:expenses/NewExpense.dart';
import 'package:expenses/chart.dart';
import 'package:expenses/components.dart';
//import 'package:expenses/components.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  // ignore: non_constant_identifier_names
  final List<Expense> expense = [
    Expense(
        category: Category.work,
        title: 'Course',
        amount: 2,
        date: DateTime.now()),
  ];

  void addexpense(Expense ex) {
    setState(() {
      expense.add(ex);
    });
  }

  void removeexpense(Expense ex) {
    setState(() {
      expense.remove(ex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses App",
          style: TextStyle(fontFamily: 'font1', fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (c) => newexpense(onadd: addexpense));
            },
            icon: Icon(Icons.add),
            iconSize: 50,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            chart(expenses: expense),
            expensesList(
              expense: expense,
              ondelete: removeexpense,
            ),
          ],
        ),
      ),
    );
  }
}
