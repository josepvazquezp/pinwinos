part of 'deck_game_bloc.dart';

sealed class DeckGameEvent extends Equatable {
  const DeckGameEvent();

  @override
  List<Object> get props => [];
}

class GetDeckEvent extends DeckGameEvent {
  final List<Carta> deck;

  GetDeckEvent({required this.deck});

  @override
  List<Object> get props => [this.deck];
}

class ShuffleDeckEvent extends DeckGameEvent {}

class GetHandEvent extends DeckGameEvent {
  final Carta card;

  GetHandEvent({required this.card});

  @override
  List<Object> get props => [this.card];
}
