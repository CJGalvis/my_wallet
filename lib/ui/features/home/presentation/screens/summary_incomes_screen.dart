import 'package:flutter/material.dart';

class SummaryIncomesScreen extends StatelessWidget {
  static const String routeName = '/summary-incomes';
  const SummaryIncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Incomes')),
      body: Center(child: Text('Hola erick estamos viendo los ingresos')),
    );
  }
}
