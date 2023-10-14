import 'package:flutter/material.dart';

import '../forms/FormCalculating.dart';

class CalculationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор квадрата суммы'),
      ),
      body: FormCalculating(),
    );
  }
}