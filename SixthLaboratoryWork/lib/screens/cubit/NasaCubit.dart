import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixthlaboratorywork/requests/Api.dart';
import 'package:sixthlaboratorywork/screens/cubit/NasaState.dart';

import '../../models/Nasa.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> loadData() async {
    try {
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
      return;
    }
    catch (exception) {
      emit(NasaErrorState());
      return;
    }
  }
}