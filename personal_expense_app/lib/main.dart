import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personal_expense_app/widgets/expenses.dart';



final colorsScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true ,
      colorScheme: colorsScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorsScheme.onPrimaryContainer,
          foregroundColor: colorsScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorsScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style : ElevatedButton.styleFrom(
          backgroundColor: colorsScheme.primaryContainer,
          elevation: 4,
        )),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: colorsScheme.onSecondaryContainer,
          ),
        )

      ),
      home: const Expenses(),
    ),
  );
}
