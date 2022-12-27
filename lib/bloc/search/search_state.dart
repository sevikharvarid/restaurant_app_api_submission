import 'package:equatable/equatable.dart';
import 'package:restaurant_app_api_submission/data/models/search_data.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchError extends SearchState {
  String? error;

  SearchError({
    this.error,
  });

  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final List<SearchRestaurant> listData;

  const SearchLoaded({required this.listData});
  @override
  List<Object?> get props => [listData];
}

class SearchNotFound extends SearchState {
  @override
  List<Object?> get props => [];
}
