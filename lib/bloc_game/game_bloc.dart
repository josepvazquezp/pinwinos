import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  Map<String, List<String>> _userSlots = {
    "fire": [],
    "water": [],
    "snow": [],
  };

  Pinwino? _p1;
  Pinwino? _p2;

  Map<String, List<String>> _enemySlots = {
    "fire": [],
    "water": [],
    "snow": [],
  };

  Pinwino _iaPinwino = new Pinwino(
    id: "123 456 789",
    nombre: "Pancho Barraza",
    correo: "caguama@gmail.com",
    password: "jokeis123",
    victorias: 0,
    derrotas: 0,
    fecha: "28 de Octubre de 2023",
    conectado: true,
    deck: [
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
    ],
    library: [],
    gorro: "assets/images/hats/cowboy_hat.webp",
    gorros: [
      "assets/images/hats/wizard_hat.webp",
      "assets/images/hats/cowboy_hat.webp",
      "assets/images/hats/cap.webp",
      "assets/images/hats/kirby_hat.png",
      "assets/images/hats/mario_hat.png",
      "assets/images/hats/sailor_hat.webp",
      "assets/images/hats/top_hat.png",
    ],
    friends: [
      "111 222 333",
      "333 222 111",
    ],
  );

  String _roundPower = "";

  bool _ia = true;

  bool _play = true;

  int _winRound = 0;

  int _gameWinner = 0;

  List<String> _elements = ["fire", "water", "snow"];

  List<String> _slotsPowers = [
    // -element
    "-fire",
    "-water",
    "-snow",

    // -color
    "-red",
    "-blue",
    "-yellow",
    "-green",
    "-orange",
    "-purple",

    // -all_color
    "-all_red",
    "-all_blue",
    "-all_yellow",
    "-all_green",
    "-all_orange",
    "-all_purple"
  ];

  GameBloc() : super(GameInitial()) {
    on<GetUserEvent>(_getData);
    on<PlayCardEvent>(_battlePhase);
    on<RandomSelectionEvent>(_randomSelection);
  }

  FutureOr<void> _getData(GetUserEvent event, Emitter emit) {
    _p1 = event.p1;

    if (event.p2 != null) {
      _p2 = event.p2;
      _ia = false;
    } else {
      _p2 = _iaPinwino;
    }

    emit(GetUsersSuccessState(p1Gorro: _p1!.gorro!, p2Gorro: _p2!.gorro!));
    // TODO: Trigerear del deck_gamebloc para hacer todo chido con el user
    // add(GetDeckEvent(deck: _p1.deck));
  }

  FutureOr<void> _battlePhase(PlayCardEvent event, Emitter emit) {
    if (!_play) {
    } else {
      emit(SelectedCardState(card: event.card));

      //TODO: IA poderosisima
      Carta enemyCard = new Carta(); //esto borrar al implementar lo de la ia
      if (_ia) {
        //todo el desmadre que voy hacer
      } else {
        // TODO: hasta http de hosteo la que ponga el otro men
      }

      emit(BattleCardsState(userCard: event.card, enemyCard: enemyCard));

      _winRound = _checkRoundWinner(event.card, enemyCard);

      if (_winRound == 1) {
        _roundPower = event.card.poder!;

        _userSlots[event.card.elemento]!.add(event.card.color!);
      } else if (_winRound == 2) {
        _roundPower = enemyCard.poder!;

        _enemySlots[enemyCard.elemento]!.add(enemyCard.color!);
      } else {
        _roundPower = "";
      }

      // eliminación de slots si gano ese poder
      if (_roundPower[0] == "-" && _roundPower[1] != "2") {
        emit(PowerRoundState(power: _roundPower));
        removeSlot();
        _roundPower = "";
      }

      emit(GetSlotsState(userSlots: _userSlots, enemySlots: _enemySlots));

      // TODO: EVALUACIÓN DE SLOTS PARA VER SI YA GANO ALGUIEN
      if (_winRound != 0) {
        _gameWinner = _checkGameWinner();

        if (_gameWinner != 0) {
          emit(EndGameState(victory: _gameWinner == 1 ? true : false));
        }
      }

      if (_roundPower != "") {
        emit(PowerRoundState(power: _roundPower));
      }

      _play = false;
    }
  }

  void removeSlot() {
    Map<String, List<String>> slots = _winRound == 1 ? _userSlots : _enemySlots;
    int indexSlotPower = _slotsPowers.indexOf(_roundPower);

    // -element
    if (indexSlotPower == 0 && slots["fire"]!.length > 0) {
      slots["fire"]!.removeLast();
    } else if (indexSlotPower == 1 && slots["water"]!.length > 0) {
      slots["water"]!.removeLast();
    } else if (indexSlotPower == 2 && slots["snow"]!.length > 0) {
      slots["snow"]!.removeLast();
    }

    // -color
    else if (indexSlotPower == 3) {
      _byeSlotColor("red");
    } else if (indexSlotPower == 4) {
      _byeSlotColor("blue");
    } else if (indexSlotPower == 5) {
      _byeSlotColor("yellow");
    } else if (indexSlotPower == 6) {
      _byeSlotColor("green");
    } else if (indexSlotPower == 7) {
      _byeSlotColor("orange");
    } else if (indexSlotPower == 8) {
      _byeSlotColor("purple");
    }

    // -all_color
    else if (indexSlotPower == 9) {
      _byeAllSlotColor("red");
    } else if (indexSlotPower == 10) {
      _byeAllSlotColor("blue");
    } else if (indexSlotPower == 11) {
      _byeAllSlotColor("yellow");
    } else if (indexSlotPower == 12) {
      _byeAllSlotColor("green");
    } else if (indexSlotPower == 13) {
      _byeAllSlotColor("orange");
    } else if (indexSlotPower == 14) {
      _byeAllSlotColor("purple");
    } else {
      print("No se encontro ese poder de eliminar slot");
    }
  }

  void _byeSlotColor(String color) {
    Map<String, List<String>> slots = _winRound == 1 ? _userSlots : _enemySlots;
    _elements.shuffle();

    for (int i = 0; i < _elements.length; i++) {
      if (slots[_elements[i]]!.length > 0) {
        if (slots[_elements[i]]!.remove(color)) {
          break;
        }
      }
    }
  }

  void _byeAllSlotColor(String color) {
    Map<String, List<String>> slots = _winRound == 1 ? _userSlots : _enemySlots;

    for (int i = 0; i < _elements.length; i++) {
      if (slots[_elements[i]]!.length > 0) {
        slots[_elements[i]]!
            .removeWhere((String colorSlot) => colorSlot == color);
      }
    }
  }

  int _checkRoundWinner(Carta userCard, Carta enemyCard) {
    String userElement;
    String enemyElement;

    if (_roundPower == "fire->snow") {
      if (userCard.elemento == "fire") {
        userElement = "snow";
      } else {
        userElement = userCard.elemento!;
      }

      if (enemyCard.elemento == "fire") {
        enemyElement = "snow";
      } else {
        enemyElement = enemyCard.elemento!;
      }
    } else if (_roundPower == "snow->water") {
      if (userCard.elemento == "snow") {
        userElement = "water";
      } else {
        userElement = userCard.elemento!;
      }

      if (enemyCard.elemento == "snow") {
        enemyElement = "water";
      } else {
        enemyElement = enemyCard.elemento!;
      }
    } else if (_roundPower == "water->fire") {
      if (userCard.elemento == "water") {
        userElement = "fire";
      } else {
        userElement = userCard.elemento!;
      }

      if (enemyCard.elemento == "water") {
        enemyElement = "fire";
      } else {
        enemyElement = enemyCard.elemento!;
      }
    } else {
      userElement = userCard.elemento!;
      enemyElement = enemyCard.elemento!;
    }

    if (userElement == enemyElement) {
      int userNum = _roundPower == "+2" && _winRound == 1
          ? userCard.numero! + 2
          : _roundPower == "-2" && _winRound == 2
              ? userCard.numero! - 2
              : userCard.numero!;

      int enemyNum = _roundPower == "+2" && _winRound == 2
          ? enemyCard.numero! + 2
          : _roundPower == "-2" && _winRound == 1
              ? enemyCard.numero! - 2
              : enemyCard.numero!;

      if (userNum > enemyNum) {
        return _roundPower == "1_9" ? 2 : 1;
      } else if (userNum == enemyNum) {
        return 0;
      }

      return _roundPower == "1_9" ? 1 : 2;
    } else if (userElement == "fire" && enemyElement == "water") {
      return 2;
    } else if (userElement == "water" && enemyElement == "fire") {
      return 1;
    } else if (userElement == "fire" && enemyElement == "snow") {
      return 1;
    } else if (userElement == "snow" && enemyElement == "fire") {
      return 2;
    } else if (userElement == "water" && enemyElement == "snow") {
      return 2;
    } else if (userElement == "snow" && enemyElement == "water") {
      return 1;
    }

    return 0;
  }

  int _checkGameWinner() {
    List<String> fire = [];
    List<String> water = [];
    List<String> snow = [];
    Map<String, List<String>> slots = _winRound == 1 ? _userSlots : _enemySlots;

    // colores diferentes por elemento
    if (slots["fire"]!.length > 0) {
      fire = slots["fire"]!.toSet().toList();
    }

    if (slots["water"]!.length > 0) {
      water = slots["water"]!.toSet().toList();
    }

    if (slots["snow"]!.length > 0) {
      snow = slots["snow"]!.toSet().toList();
    }

    // chequeo de victoria 3 del mismo elemento
    if (fire.length >= 3) return _winRound == 1 ? 1 : 2;

    if (water.length >= 3) return _winRound == 1 ? 1 : 2;

    if (snow.length >= 3) return _winRound == 1 ? 1 : 2;

    // cheque de victoria 3 de diferente elemento
    if (fire.length > 0 && water.length > 0 && snow.length > 0) {
      for (int i = 0; i < fire.length; i++) {
        for (int j = 0; j < water.length; i++) {
          for (int k = 0; k < snow.length; i++) {
            if (fire[i] != water[j] &&
                fire[i] != snow[k] &&
                water[j] != snow[k]) {
              return _winRound == 1 ? 1 : 2;
            }
          }
        }
      }

      return 0;
    }

    return 0;
  }

  // TODO: en el caso de no elegir carta que se seleccione una random
  FutureOr<void> _randomSelection(RandomSelectionEvent event, Emitter emit) {}
}
