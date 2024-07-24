import 'package:expense_tracker/widgets/expenses-list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Holiday',
      amount: 50,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Party',
      amount: 100,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

void _openAddExpenseOverlay() {
  showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add more"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("uper wala"),
          Expanded(
            child: ExpenseList(expenses: registeredExpenses),
          ),
        ],
      ),
    );
  }
}
