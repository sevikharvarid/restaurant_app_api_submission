import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_event.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_state.dart';
import 'package:restaurant_app_api_submission/data/api/api_service.dart';
import 'package:restaurant_app_api_submission/data/models/get_list_data.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ListData? listData;
  AppService apiService = AppService();
  int data = 10;

  HomeBloc() : super(HomeLoading()) {
    on<HomeStarted>(getStartedList);
  }

  FutureOr<void> getStartedList(
      HomeStarted event, Emitter<HomeState> emit) async {
    try {
      listData = await apiService.fetchListData();
      emit(HomeLoading());
      emit(
        HomeLoaded(
          listData: listData!.restaurants,
        ),
      );
    } catch (e) {
      emit(
        HomeError(
          error: e.toString(),
        ),
      );
    }
  }
}
