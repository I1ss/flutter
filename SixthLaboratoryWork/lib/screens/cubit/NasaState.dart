import '../../models/Camera.dart';
import '../../models/Nasa.dart';
import '../../models/Rover.dart';

abstract class NasaState {}

class NasaLoadingState extends NasaState {}

class NasaLoadedState extends NasaState {
  Nasa data;
  double offset;
  NasaLoadedState(this.data, this.offset);
}

class NasaErrorState extends NasaState {}

class PhotoDetailInitialState extends NasaState {}

class PhotoDetailShownState extends NasaState {
  Camera? camera;
  Rover? rover;
  String? imgSrc;
  Nasa data;
  double offset;

  PhotoDetailShownState(this.imgSrc, this.camera, this.rover, this.data, this.offset);
}