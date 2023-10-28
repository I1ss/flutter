import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixthlaboratorywork/requests/Api.dart';
import 'package:sixthlaboratorywork/screens/cubit/NasaState.dart';

import '../../models/Camera.dart';
import '../../models/Nasa.dart';
import '../../models/Rover.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> loadData() async {
    try {
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(nasaData, 0));
    }
    catch (exception) {
      emit(NasaErrorState());
    }
  }

  void showPhotoDetail(Camera? camera, String? imgSrc, Rover? rover, Nasa data, double offset) {
    emit(PhotoDetailShownState(imgSrc, camera, rover, data, offset));
  }

  void closePhotoDetail() {
    emit(PhotoDetailInitialState());
  }

  void showData(Nasa data, double offset) {
    emit(NasaLoadedState(data, offset));
  }
}