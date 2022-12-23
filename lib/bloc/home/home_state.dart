import 'package:equatable/equatable.dart';
import 'package:restaurant_app_api_submission/data/models/get_list_data.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<Restaurant> listData;

  const HomeLoaded({
    required this.listData,
  });

  @override
  List<Object?> get props => [listData];
}

class HomeError extends HomeState {
  final String? error;
  HomeError({
    this.error,
  });
  @override
  List<Object?> get props => [];
}
