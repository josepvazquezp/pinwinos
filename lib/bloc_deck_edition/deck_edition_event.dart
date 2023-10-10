part of 'deck_edition_bloc.dart';

sealed class DeckEditionEvent extends Equatable {
  const DeckEditionEvent();

  @override
  List<Object> get props => [];
}

class GetDeckLibraryEvent extends DeckEditionEvent {}
