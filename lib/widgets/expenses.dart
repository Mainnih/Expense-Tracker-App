import './chart/chart.dart';

import 'package:expense_tracker_v2/widgets/new_expense.dart';

import 'expense_list/expenses_list.dart';
import '../models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

final List<Expense> _registerExpenses = [
  // Expense(
  //     title: 'Flutter',
  //     amount: 99.99,
  //     date: DateTime.now(),
  //     category: Category.work),
  // Expense(
  //     title: 'Cake',
  //     amount: 3.33,
  //     date: DateTime.now(),
  //     category: Category.food)
];

class _ExpensesState extends State<Expenses> {
  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

//Review
  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverLay(BuildContext context) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    //review
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        //centerTitle: false,
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: () => _openAddExpenseOverLay(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                //  ChartBar(fill: ),
                Chart(
                  expenses: _registerExpenses,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registerExpenses,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
