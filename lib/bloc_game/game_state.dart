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

  GetUsersSuccessState({required this.p1Gorro, required this.p2Gorro});

  @override
  List<Object> get props => [this.p1Gorro, this.p2Gorro];
}

final class ErrorGetDataState extends GameState {}

final class SelectedCardState extends GameState {
  final Carta card;

  SelectedCardState({required this.card});

  @override
  List<Object> get props => [this.card];
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

final class EndGameState extends GameState {
  final bool victory;

  EndGameState({required this.victory});

  @override
  List<Object> get props => [this.victory];
}
