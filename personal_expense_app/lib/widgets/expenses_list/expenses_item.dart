import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_expense_app/model/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense , {super.key});

  final Expense expense;


  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
        child:Column(
          children: [
            Text(
             expense.title
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}'
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(catIcons[expense.category]),
                    const SizedBox(height: 10,),
                    Text(expense.formattedDate)

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}