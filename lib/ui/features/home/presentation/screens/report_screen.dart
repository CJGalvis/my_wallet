import 'package:flutter/material.dart';


class ReportScreen extends StatelessWidget {
  static const String routeName = '/report';
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report')),
      body: Center(child: Text('Hola camilo estamos en los reportes')),
    );
  }
}
