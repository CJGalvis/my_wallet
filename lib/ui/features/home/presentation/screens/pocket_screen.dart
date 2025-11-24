import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';

class PocketScreen extends StatelessWidget {
  static const String routeName = '/pocket';
  final Pocket pocket;

  const PocketScreen({super.key, required this.pocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pocket.name)),
      body: Center(
          child: Text('Hola erick estamos viendo un nuevo bolsillo')),
    );
  }
}
