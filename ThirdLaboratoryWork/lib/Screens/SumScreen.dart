import 'package:flutter/material.dart';

class SumScreen extends StatelessWidget {
  final double paramFirst;
  final double paramSecond;

  SumScreen({required this.paramFirst, required this.paramSecond});

  @override
  Widget build(BuildContext context) {
    double sum = (paramFirst + paramSecond) * (paramFirst + paramSecond);

    return Scaffold(
      appBar: AppBar(
        title: Text('Сумма параметров в квадрате'),
      ),
      body: Center(
        child: Text('Сумма: $sum'),
      ),
    );
  }
}