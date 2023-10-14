import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CalculationState.dart';
import 'ResultState.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(InitialCalculationState());

  int counter = 0;

  Future<void> calculateSum(double first, double second) async {
    final prefs = await SharedPreferences.getInstance();
    final double sum = (first + second) * (first + second);

    await prefs.setDouble("first_value: $counter", first);
    await prefs.setDouble("second_value: $counter", second);
    await prefs.setDouble("sum_value: $counter", sum);
    await prefs.setInt("counter_value", counter);
    counter++;

    emit(ResultState(sum));
  }

  void navigateToResult() {
    emit(InitialCalculationState());
  }
}