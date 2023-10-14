part of 'deck_edition_bloc.dart';

sealed class DeckEditionEvent extends Equatable {
  const DeckEditionEvent();

  @override
  List<Object> get props => [];
}

class GetDeckLibraryEvent extends DeckEditionEvent {}

class AddCardDeckEvent extends DeckEditionEvent {
  final int index;

  AddCardDeckEvent({required this.index});

  @override
  List<Object> get props => [this.index];
}

class AddCardLibraryEvent extends DeckEditionEvent {
  final int index;

  AddCardLibraryEvent({required this.index});

  @override
  List<Object> get props => [this.index];
}
