import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/CalculationScreen.dart';
import 'screens/ResultScreen.dart';
import 'screens/cubit/CalculationCubit.dart';
import 'screens/cubit/CalculationState.dart';
import 'screens/cubit/ResultState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CalculationCubit(),
        child: BlocBuilder<CalculationCubit, CalculationState>(
          builder: (context, state) {
            if (state is ResultState) {
              return ResultScreen(state.sum);
            }
            else {
              return CalculationScreen();
            }
          },
        ),
      ),
    );
  }
}