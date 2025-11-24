import 'package:flutter/material.dart';

class NewRecordScreen extends StatelessWidget {
  static const String routeName = '/new-record';
  const NewRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New record')),
      body: Center(child: Text('Hola erick estamos creando un nuevo registro')),
    );
  }
}
