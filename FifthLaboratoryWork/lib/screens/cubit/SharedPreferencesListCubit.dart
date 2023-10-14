import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPreferencesState.dart';

class SharedPreferencesDataCubit extends Cubit<SharedPreferencesState> {
  SharedPreferencesDataCubit() : super(SharedPreferencesData());

  void loadSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();

    List<double> listFirstValues = [];
    List<double> listSecondValues = [];
    List<double> listSumValues = [];

    int counter = await prefs.getInt("counter_value") ?? 0;
    for (int i = 0; i <= counter; i++) {
      listFirstValues.add(await prefs.getDouble("first_value: $i") ?? 0);
      listSecondValues.add(await prefs.getDouble("second_value: $i") ?? 0);
      listSumValues.add(await prefs.getDouble("sum_value: $i") ?? 0);
    }

    final data = SharedPreferencesData()
      ..listFirstValues = listFirstValues
      ..listSecondValues = listSecondValues
      ..listSumValues = listSumValues;

    emit(data);
  }
}
