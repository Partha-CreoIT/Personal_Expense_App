import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personal_expense_app/widgets/expenses.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     GetMaterialApp(
      home: const Expenses(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple
        ), // Set accent color to purple accent
      ),
    ),
  );
}