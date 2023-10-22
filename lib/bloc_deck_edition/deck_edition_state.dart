part of 'deck_edition_bloc.dart';

sealed class DeckEditionState extends Equatable {
  const DeckEditionState();

  @override
  List<Object> get props => [];
}

final class DeckEditionInitial extends DeckEditionState {}

final class DeckLibrayDisplayState extends DeckEditionState {
  final List<Carta> deck;
  final List<Carta> library;

  DeckLibrayDisplayState({required this.deck, required this.library});

  @override
  List<Object> get props => [deck, library];
}

final class UpdateDeckLibrayDisplayState extends DeckEditionState {
  final List<Carta> deck;
  final List<Carta> library;

  UpdateDeckLibrayDisplayState({required this.deck, required this.library});

  @override
  List<Object> get props => [deck, library];
}

final class BadCardUpdateState extends DeckEditionState {}

final class ErrorDeckLibraryRequestState extends DeckEditionState {}
