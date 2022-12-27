import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_event.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_state.dart';
import 'package:restaurant_app_api_submission/data/api/api_service.dart';
import 'package:restaurant_app_api_submission/data/models/search_data.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchData? searchData;
  AppService apiService = AppService();

  SearchBloc() : super(SearchInitial()) {
    on<SearchStarted>(onSearchStarted);
  }

  FutureOr<void> onSearchStarted(
      SearchStarted event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoading());
      searchData = await apiService.searchListData(event.query!);
      if (searchData!.error) {
        emit(SearchError());
      } else {
        if (searchData!.founded != 0) {
          emit(SearchLoaded(listData: searchData!.restaurants));
        } else {
          emit(SearchNotFound());
        }
      }
    } catch (e) {
      emit(SearchError());
    }
  }
}
