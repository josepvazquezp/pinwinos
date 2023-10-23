part of 'deck_game_bloc.dart';

sealed class DeckGameState extends Equatable {
  const DeckGameState();

  @override
  List<Object> get props => [];
}

final class DeckGameInitial extends DeckGameState {}

final class GetDeckSuccessState extends DeckGameState {}

final class ErrorGetDeckState extends DeckGameState {}

final class GetHandState extends DeckGameState {
  final List<Carta> hand;

  GetHandState({required this.hand});

  @override
  List<Object> get props => [this.hand];
}

final class UpdateGetHandState extends DeckGameState {
  final List<Carta> hand;

  UpdateGetHandState({required this.hand});

  @override
  List<Object> get props => [this.hand];
}
