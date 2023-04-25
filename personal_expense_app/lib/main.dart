import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/expenses.dart';



void main() {
  runApp(
     const MaterialApp(
      home:Expenses(),
      debugShowCheckedModeBanner: false,
    ),
  );
}