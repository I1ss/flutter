import 'package:flutter_bloc/flutter_bloc.dart';

import 'CalculationState.dart';
import 'ResultState.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(InitialCalculationState());

  void calculateSum(double first, double second) {
    final double sum = (first + second) * (first + second);
    emit(ResultState(sum));
  }

  void navigateToResult() {
    emit(InitialCalculationState());
  }
}