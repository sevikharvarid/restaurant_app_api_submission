import 'package:equatable/equatable.dart';
import 'package:restaurant_app_api_submission/data/models/detail_data.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitial extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoading extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoaded extends DetailState {
  final RestaurantDetail restaurantDetail;

  const DetailLoaded({
    required this.restaurantDetail,
  });

  @override
  List<Object?> get props => [restaurantDetail];
}
