import 'package:flutter/material.dart';

class SummaryExpensesScreen extends StatelessWidget {
  static const String routeName = '/summary-expenses';
  const SummaryExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses')),
      body: Center(child: Text('Hola erick estamos viendo los egresos')),
    );
  }
}
