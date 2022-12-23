import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class DetailStarted extends DetailEvent {
  final String? id;

  const DetailStarted({
    this.id,
  });

  @override
  List<Object?> get props => [id];
}
