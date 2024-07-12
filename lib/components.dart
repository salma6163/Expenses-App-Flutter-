import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateformat = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categIcon = {
  Category.food: Icons.food_bank,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
};

class Expense {
  String Format() {
    return dateformat.format(date);
  }

  String id;
  String title;
  double amount;
  DateTime date;
  Category category;
  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}

//uuid package for auto generate unique id

//intl for date
class ExpensesBucket {
  final Category category;
  final List<Expense> expenses;

  ExpensesBucket(this.category, this.expenses);
  ExpensesBucket.forcategory(this.category, List<Expense> allExpenses)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();
  double get totalexpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
