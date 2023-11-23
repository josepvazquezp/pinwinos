import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'deck_edition_event.dart';
part 'deck_edition_state.dart';

class DeckEditionBloc extends Bloc<DeckEditionEvent, DeckEditionState> {
  String _idUser = "";
  List<Carta> _deck = [];
  List<Carta> _library = [];

  bool _update = false;
  List<List<String>> _powersArray = [
    ["-fire", "-water", "-snow"],
    ["-red", "-blue", "-yellow", "-green", "-orange", "-purple"],
    [
      "-all_red",
      "-all_blue",
      "-all_yellow",
      "-all_green",
      "-all_orange",
      "-all_purple"
    ],
    ["block_water", "block_fire", "block_snow"],
    ["water->fire", "snow->water", "fire->snow"]
  ];
  List<Carta> _filterDeck = [];
  List<Carta> _filterLibrary = [];
  List<String> _elements = ["fire", "water", "snow"];
  bool _filter = false;

  List<Carta> get getDeck => _deck;
  List<Carta> get getLibrary => _library;

  DeckEditionBloc() : super(DeckEditionInitial()) {
    on<GetDeckLibraryEvent>(_getDeckLibraryEvent);
    on<AddCardDeckEvent>(_addCardDeckEvent);
    on<AddCardLibraryEvent>(_addCardLibraryEvent);
    on<ChangeStateEvent>(_changeStateEvent);
    on<FilterCardsEvent>(_filterCardsEvent);
  }

  FutureOr<void> _getDeckLibraryEvent(GetDeckLibraryEvent event, Emitter emit) {
    _deck = event.user.deck!;
    _library = event.user.library!;
    _idUser = event.user.id!;

    emit(DeckLibrayDisplayState(deck: getDeck, library: getLibrary));
  }

  FutureOr<void> _addCardDeckEvent(AddCardDeckEvent event, Emitter emit) {
    Carta temp = _filter ? _filterLibrary[event.index] : _library[event.index];

    bool validate = _checkDeck(temp);

    if (validate) {
      if (_filter) {
        _filterLibrary.removeAt(event.index);
        _filterDeck.add(temp);
        _library.remove(temp);
      } else {
        _library.removeAt(event.index);
      }

      _deck.add(temp);

      if (_update) {
        _update = !_update;
        emit(DeckLibrayDisplayState(
            deck: _filter ? _filterDeck : getDeck,
            library: _filter ? _filterLibrary : getLibrary));
      } else {
        _update = !_update;
        emit(UpdateDeckLibrayDisplayState(
            deck: _filter ? _filterDeck : getDeck,
            library: _filter ? _filterLibrary : getLibrary));
      }
    } else
      emit(BadCardUpdateState());
  }

  bool _checkDeck(Carta temp) {
    int type = 5;

    for (int i = 0; i < _powersArray.length; i++) {
      if (_powersArray[i].contains(temp.poder)) type = i;
    }

    for (int i = 0; i < _deck.length; i++) {
      if (_deck[i].poder != "") {
        if (type == 5 && _deck[i].poder == temp.poder) return false;
        if (type < 5 && _powersArray[type].contains(_deck[i].poder))
          return false;
      }
    }

    return true;
  }

  FutureOr<void> _addCardLibraryEvent(AddCardLibraryEvent event, Emitter emit) {
    Carta temp = _filter ? _filterDeck[event.index] : _deck[event.index];

    if (temp.poder != "") {
      if (_filter) {
        _filterDeck.removeAt(event.index);
        _filterLibrary.add(temp);
        _deck.remove(temp);
      } else {
        _deck.removeAt(event.index);
      }

      _library.add(temp);

      if (_update) {
        _update = !_update;
        emit(DeckLibrayDisplayState(
            deck: _filter ? _filterDeck : getDeck,
            library: _filter ? _filterLibrary : getLibrary));
      } else {
        _update = !_update;
        emit(UpdateDeckLibrayDisplayState(
            deck: _filter ? _filterDeck : getDeck,
            library: _filter ? _filterLibrary : getLibrary));
      }
    } else
      emit(BadCardUpdateState());
  }

  FutureOr<void> _changeStateEvent(ChangeStateEvent event, Emitter emit) {
    if (_update) {
      _update = !_update;
      emit(DeckLibrayDisplayState(
          deck: _filter ? _filterDeck : getDeck,
          library: _filter ? _filterLibrary : getLibrary));
    } else {
      _update = !_update;
      emit(UpdateDeckLibrayDisplayState(
          deck: _filter ? _filterDeck : getDeck,
          library: _filter ? _filterLibrary : getLibrary));
    }
  }

  FutureOr<void> _filterCardsEvent(FilterCardsEvent event, Emitter emit) {
    int type;

    switch (event.filter) {
      case "fuego":
        type = 0;
        break;
      case "agua":
        type = 1;
        break;
      case "nieve":
        type = 2;
        break;
      default:
        type = 3;
    }

    if (type < 3) {
      _filterDeck = [];
      _filterLibrary = [];
      _filter = true;

      int size =
          _deck.length >= _library.length ? _deck.length : _library.length;

      for (int i = 0; i < size; i++) {
        if (i < _deck.length && _deck[i].elemento == _elements[type])
          _filterDeck.add(_deck[i]);

        if (i < _library.length && _library[i].elemento == _elements[type])
          _filterLibrary.add(_library[i]);
      }
    } else {
      _filter = false;
    }

    if (_update) {
      _update = !_update;
      emit(DeckLibrayDisplayState(
          deck: type < 3 ? _filterDeck : getDeck,
          library: type < 3 ? _filterLibrary : getLibrary));
    } else {
      _update = !_update;
      emit(UpdateDeckLibrayDisplayState(
          deck: type < 3 ? _filterDeck : getDeck,
          library: type < 3 ? _filterLibrary : getLibrary));
    }
  }
}
