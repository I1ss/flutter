import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/CalculationCubit.dart';

class ResultScreen extends StatelessWidget {
  final double sum;

  ResultScreen(this.sum);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Сумма: $sum'),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CalculationCubit>(context).navigateToResult();
              },
              child: Text('Вернуться'),
            ),
          ],
        ),
      ),
    );
  }
}