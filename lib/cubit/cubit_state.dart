part of 'app_cubit.dart';

@immutable
abstract class CubitState extends Equatable {
  const CubitState();

  @override
  List<Object> get props => [];
}

class CubitInitial extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  final List<DataModel> places;
  const LoadedState(this.places);
  @override
  List<Object> get props => [places];
}


class DatailState extends CubitState {
  final DataModel place;
  const DatailState(this.place);
  @override
  List<Object> get props => [place];
}