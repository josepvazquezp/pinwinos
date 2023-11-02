import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/models/carta.dart';

part 'deck_game_event.dart';
part 'deck_game_state.dart';

class DeckGameBloc extends Bloc<DeckGameEvent, DeckGameState> {
  List<Carta> _deck = [];
  List<Carta> _actualHand = [];
  Carta _garbageCard = new Carta();
  int _pointer = -1;
  bool _update = false;

  List<Carta> get getActualHand => _actualHand;

  DeckGameBloc() : super(DeckGameInitial()) {
    on<GetDeckEvent>(_getDeck);
    on<ShuffleDeckEvent>(_shuffleDeck);
    on<GetHandEvent>(_getHand);
  }

  FutureOr<void> _getDeck(GetDeckEvent event, Emitter emit) {
    _deck = event.deck;
    emit(GetDeckSuccessState());
    add(ShuffleDeckEvent());
  }

  FutureOr<void> _shuffleDeck(ShuffleDeckEvent event, Emitter emit) {
    _deck.shuffle();

    add(GetHandEvent(card: _garbageCard));
  }

  FutureOr<void> _getHand(GetHandEvent event, Emitter emit) {
    _pointer++;

    if (_pointer == _deck.length) {
      _deck.shuffle();
      _pointer = 0;
    }

    if (_actualHand.length == 0) {
      for (int i = 0; i < 4; i++) {
        _actualHand.add(_deck[i]);
      }

      _pointer = 3;
    } else {
      _actualHand.remove(event.card);
      _actualHand.insert(0, _deck[_pointer]);
    }

    if (_update) {
      _update = !_update;
      emit(GetHandState(hand: _actualHand));
    } else {
      _update = !_update;
      emit(UpdateGetHandState(hand: _actualHand));
    }
  }
}
