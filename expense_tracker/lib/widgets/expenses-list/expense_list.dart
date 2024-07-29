import 'package:expense_tracker/widgets/expenses-list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, idx) => Dismissible(
        onDismissed: (direction) {
          removeExpense(
            expenses[idx],
          );
        },
        key: ValueKey(expenses[idx]),
        child: ExpenseItem(expenses[idx]),
      ),
    );
  }
}
