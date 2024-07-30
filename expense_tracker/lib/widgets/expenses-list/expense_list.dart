import 'package:expense_tracker/widgets/expenses-list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, idx) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[idx],
          );
        },
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.25),
          margin: const EdgeInsets.symmetric(horizontal: 15),
        ),
        key: ValueKey(expenses[idx]),
        child: ExpenseItem(expenses[idx]),
      ),
    );
  }
}
