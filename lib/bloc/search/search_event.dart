import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchStarted extends SearchEvent {
  final String? query;
  SearchStarted({
    this.query,
  });
  @override
  List<Object?> get props => [query];
}
