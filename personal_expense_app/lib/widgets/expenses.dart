import 'package:flutter/material.dart';
import 'package:personal_expense_app/model/new_expense.dart';
import 'package:personal_expense_app/widgets/expenses_list/expenses_list.dart';

import '../model/expense.dart';
import 'chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter Coarse',
        amount: 19.9,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 19.9,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(label: 'Undo',
            onPressed: (){
          setState(() {
            _registeredExpense.insert(expenseIndex,expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(

        children: [
          Chart(expenses:_registeredExpense),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpense,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ) : Row(children: [
        Expanded(child: Container(
          height: 340,
            child: Chart(expenses:_registeredExpense))),
        Expanded(
          child: ExpensesList(
            expenses: _registeredExpense,
            onRemoveExpense: _removeExpense,
          ),
        ), 

      ],)
    );

  }
}
