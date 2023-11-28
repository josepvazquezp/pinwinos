part of 'game_bloc.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {}

final class GetUsersSuccessState extends GameState {
  final String p1Gorro;
  final String p2Gorro;
  final String room_id;

  GetUsersSuccessState(
      {required this.p1Gorro, required this.p2Gorro, required this.room_id});

  @override
  List<Object> get props => [this.p1Gorro, this.p2Gorro, this.room_id];
}

final class ErrorGetDataState extends GameState {}

final class SelectedCardState extends GameState {
  final Carta card;
  final String room_id;

  SelectedCardState({required this.card, required this.room_id});

  @override
  List<Object> get props => [this.card, this.room_id];
}

final class BattleCardsState extends GameState {
  final Carta userCard;
  final Carta enemyCard;

  BattleCardsState({required this.userCard, required this.enemyCard});

  @override
  List<Object> get props => [this.userCard, this.enemyCard];
}

final class PowerRoundState extends GameState {
  final String power;

  PowerRoundState({required this.power});

  @override
  List<Object> get props => [this.power];
}

final class GetSlotsState extends GameState {
  final Map<String, List<String>> userSlots;
  final Map<String, List<String>> enemySlots;

  GetSlotsState({required this.userSlots, required this.enemySlots});

  @override
  List<Object> get props => [this.userSlots, this.enemySlots];
}

final class EndGameState extends GameState {
  final bool victory;

  EndGameState({required this.victory});

  @override
  List<Object> get props => [this.victory];
}

final class CurrentTimeState extends GameState {}

final class UpdateCurrentTimeState extends GameState {}
