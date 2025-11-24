import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
  static const String routeName = '/records';
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Records')),
      body: Center(child: Text('Hola erick estamos viendo un los registros')),
    );
  }
}
