import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_event.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_state.dart';
import 'package:restaurant_app_api_submission/data/api/api_service.dart';
import 'package:restaurant_app_api_submission/data/models/detail_data.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailData? detailData;

  AppService apiService = AppService();

  DetailBloc() : super(DetailInitial()) {
    on<DetailStarted>(loadData);
  }

  FutureOr<void> loadData(
      DetailStarted event, Emitter<DetailState> emit) async {
    emit(
      DetailLoading(),
    );
    detailData = await apiService.getDetailData(
      event.id!,
    );
    emit(
      DetailLoaded(restaurantDetail: detailData!.restaurant),
    );
  }
}
