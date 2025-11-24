import 'package:flutter/material.dart';

class NewPocketScreen extends StatelessWidget {
  static const String routeName = '/new-pocket';
  const NewPocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New pocket')),
      body: Center(child: Text('Hola erick estamos creando un nuevo bolsillo')),
    );
  }
}
