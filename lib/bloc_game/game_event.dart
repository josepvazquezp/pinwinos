part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GetUserBattleEvent extends GameEvent {
  final Pinwino p1;
  final String? p2;
  final String? room_id;

  GetUserBattleEvent({required this.p1, this.p2, this.room_id});

  @override
  List<Object> get props =>
      this.p2 == null ? [this.p1] : [this.p1, this.p2!, this.room_id!];
}

class PlayCardEvent extends GameEvent {
  final Carta card;

  PlayCardEvent({required this.card});

  @override
  List<Object> get props => [this.card];
}

class CardsReadyEvent extends GameEvent {}

class RandomSelectionEvent extends GameEvent {}

class TimerUpdateEvent extends GameEvent {}
