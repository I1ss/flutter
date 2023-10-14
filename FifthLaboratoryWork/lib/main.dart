import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/CalculationScreen.dart';
import 'screens/ResultScreen.dart';
import 'screens/SharedPreferencesDataScreen.dart';
import 'screens/cubit/CalculationCubit.dart';
import 'screens/cubit/CalculationState.dart';
import 'screens/cubit/ResultState.dart';

void main() => runApp(MaterialApp(
  title: "App",
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text('Лебедев Георгий Олегович'),
        leading: IconButton(
          icon: const Icon(Icons.add_card_sharp),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => SharedPreferencesDataScreen(),
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
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