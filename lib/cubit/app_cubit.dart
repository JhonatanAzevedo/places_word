import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:places_world_app/model/data_model.dart';
import 'package:places_world_app/services/data_services.dart';

part 'cubit_state.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit({required this.data}) : super(CubitInitial()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final List<DataModel> places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  datailPage(DataModel data) {
    emit(DatailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
