import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';

part 'deck_edition_event.dart';
part 'deck_edition_state.dart';

class DeckEditionBloc extends Bloc<DeckEditionEvent, DeckEditionState> {
  List<Carta> deck = [
    new Carta(
      imagen: "assets/images/cards/c1.png",
      numero: 3,
      color: "blue",
      elemento: "fire",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c2.png",
      numero: 6,
      color: "purple",
      elemento: "fire",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c3.png",
      numero: 2,
      color: "yellow",
      elemento: "fire",
      poder: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c4.png",
      numero: 3,
      color: "orange",
      elemento: "snow",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c5.png",
      numero: 2,
      color: "red",
      elemento: "snow",
      poder: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c6.png",
      numero: 7,
      color: "yellow",
      elemento: "snow",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c7.png",
      numero: 5,
      color: "blue",
      elemento: "water",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c8.png",
      numero: 2,
      color: "green",
      elemento: "water",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c9.png",
      numero: 4,
      color: "purple",
      elemento: "water",
      poder: "",
      poder_imagen: "",
    ),
    new Carta(
      imagen: "assets/images/cards/c10.png",
      numero: 10,
      color: "yellow",
      elemento: "fire",
      poder: "1_9",
      poder_imagen: "assets/images/elements/1_9_effect.png",
    ),
  ];

  List<Carta> library = [
    new Carta(
      imagen: "assets/images/cards/c11.png",
      numero: 10,
      color: "yellow",
      elemento: "water",
      poder: "1_9",
      poder_imagen: "assets/images/elements/1_9_effect.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c12.png",
      numero: 10,
      color: "yellow",
      elemento: "snow",
      poder: "1_9",
      poder_imagen: "assets/images/elements/1_9_effect.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c13.png",
      numero: 12,
      color: "red",
      elemento: "fire",
      poder: "+2",
      poder_imagen: "assets/images/elements/plus_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c14.png",
      numero: 12,
      color: "orange",
      elemento: "snow",
      poder: "+2",
      poder_imagen: "assets/images/elements/plus_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c15.png",
      numero: 12,
      color: "purple",
      elemento: "water",
      poder: "+2",
      poder_imagen: "assets/images/elements/plus_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c16.png",
      numero: 12,
      color: "blue",
      elemento: "fire",
      poder: "-2",
      poder_imagen: "assets/images/elements/remove_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c17.png",
      numero: 12,
      color: "orange",
      elemento: "snow",
      poder: "-2",
      poder_imagen: "assets/images/elements/remove_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c18.png",
      numero: 12,
      color: "yellow",
      elemento: "water",
      poder: "-2",
      poder_imagen: "assets/images/elements/remove_2.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c19.png",
      numero: 10,
      color: "orange",
      elemento: "fire",
      poder: "-snow",
      poder_imagen: "assets/images/elements/bye_snow_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c20.png",
      numero: 10,
      color: "green",
      elemento: "snow",
      poder: "-water",
      poder_imagen: "assets/images/elements/bye_water_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c21.png",
      numero: 10,
      color: "orange",
      elemento: "water",
      poder: "-fire",
      poder_imagen: "assets/images/elements/bye_fire_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c22.png",
      numero: 11,
      color: "purple",
      elemento: "fire",
      poder: "-red",
      poder_imagen: "assets/images/elements/bye_red_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c23.png",
      numero: 11,
      color: "purple",
      elemento: "water",
      poder: "-blue",
      poder_imagen: "assets/images/elements/bye_blue_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c24.png",
      numero: 11,
      color: "purple",
      elemento: "snow",
      poder: "-green",
      poder_imagen: "assets/images/elements/bye_green_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c25.png",
      numero: 11,
      color: "green",
      elemento: "fire",
      poder: "-yellow",
      poder_imagen: "assets/images/elements/bye_yellow_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c26.png",
      numero: 11,
      color: "green",
      elemento: "water",
      poder: "-orange",
      poder_imagen: "assets/images/elements/bye_orange_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c27.png",
      numero: 11,
      color: "yellow",
      elemento: "snow",
      poder: "-purple",
      poder_imagen: "assets/images/elements/bye_purple_random.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c28.png",
      numero: 11,
      color: "blue",
      elemento: "fire",
      poder: "-all_red",
      poder_imagen: "assets/images/elements/bye_all_red.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c29.png",
      numero: 10,
      color: "yellow",
      elemento: "fire",
      poder: "-all_blue",
      poder_imagen: "assets/images/elements/bye_all_blue.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c30.png",
      numero: 12,
      color: "orange",
      elemento: "fire",
      poder: "-all_green",
      poder_imagen: "assets/images/elements/bye_all_green.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c31.png",
      numero: 10,
      color: "purple",
      elemento: "water",
      poder: "-all_yellow",
      poder_imagen: "assets/images/elements/bye_all_yellow.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c32.png",
      numero: 9,
      color: "purple",
      elemento: "snow",
      poder: "-all_orange",
      poder_imagen: "assets/images/elements/bye_all_orange.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c33.png",
      numero: 10,
      color: "green",
      elemento: "snow",
      poder: "-all_purple",
      poder_imagen: "assets/images/elements/bye_all_purple.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c34.png",
      numero: 9,
      color: "red",
      elemento: "fire",
      poder: "block_snow",
      poder_imagen: "assets/images/elements/block_snow.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c35.png",
      numero: 9,
      color: "blue",
      elemento: "water",
      poder: "block_fire",
      poder_imagen: "assets/images/elements/block_fire.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c36.png",
      numero: 9,
      color: "orange",
      elemento: "snow",
      poder: "block_water",
      poder_imagen: "assets/images/elements/block_water.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c37.png",
      numero: 9,
      color: "blue",
      elemento: "fire",
      poder: "water->fire",
      poder_imagen: "assets/images/elements/change_water_fire.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c38.png",
      numero: 9,
      color: "blue",
      elemento: "water",
      poder: "snow->water",
      poder_imagen: "assets/images/elements/change_snow_water.png",
    ),
    new Carta(
      imagen: "assets/images/cards/c39.png",
      numero: 9,
      color: "blue",
      elemento: "water",
      poder: "fire->snow",
      poder_imagen: "assets/images/elements/change_fire_snow.png",
    ),
  ];

  bool _update = false;

  DeckEditionBloc() : super(DeckEditionInitial()) {
    on<GetDeckLibraryEvent>(_getDeckLibraryEvent);
    on<AddCardDeckEvent>(_addCardDeckEvent);
    on<AddCardLibraryEvent>(_addCardLibraryEvent);
  }

  FutureOr<void> _getDeckLibraryEvent(GetDeckLibraryEvent event, Emitter emit) {
    emit(DeckLibrayDisplayState(deck: deck, library: library));
  }

  FutureOr<void> _addCardDeckEvent(AddCardDeckEvent event, Emitter emit) {
    Carta temp = library[event.index];

    library.removeAt(event.index);
    deck.add(temp);

    if (_update) {
      _update = !_update;
      emit(DeckLibrayDisplayState(deck: deck, library: library));
    } else {
      _update = !_update;
      emit(UpdateDeckLibrayDisplayState(deck: deck, library: library));
    }
  }

  FutureOr<void> _addCardLibraryEvent(AddCardLibraryEvent event, Emitter emit) {
    Carta temp = deck[event.index];

    deck.removeAt(event.index);
    library.add(temp);

    if (_update) {
      _update = !_update;
      emit(DeckLibrayDisplayState(deck: deck, library: library));
    } else {
      _update = !_update;
      emit(UpdateDeckLibrayDisplayState(deck: deck, library: library));
    }
  }
}
