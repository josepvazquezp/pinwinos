part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends GameEvent {
  final Pinwino p1;
  final Pinwino? p2;

  GetUserEvent({required this.p1, this.p2});

  @override
  List<Object> get props => this.p2 == null ? [this.p1] : [this.p1, this.p2!];
}

class PlayCardEvent extends GameEvent {
  final Carta card;

  PlayCardEvent({required this.card});

  @override
  List<Object> get props => [this.card];
}

class RandomSelectionEvent extends GameEvent {}
