import 'package:flutter/material.dart';
import 'package:personal_expense_app/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(catIcons[expense.category]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    expense.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text('\₹${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [Icon(Icons.calendar_today),Text(expense.formattedDate),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
