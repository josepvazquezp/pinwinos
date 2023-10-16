import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'room_list_event.dart';
part 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  final Pinwino player = new Pinwino(
    id: "123 456 789",
    nombre: "Pancho Barraza",
    correo: "caguama@gmail.com",
    password: "jokeis123",
    victorias: 0,
    derrotas: 0,
    fecha: "28 de Octubre de 2023",
    conectado: true,
    deck: [],
    library: [],
    gorro: "assets\images\hats\cowboy_hat.webp",
    gorros: [
      "assets/images/hats/wizard_hat.webp",
      "assets/images/hats/cowboy_hat.webp",
    ],
    friends: [
      "111 222 333",
      "333 222 111",
    ],
  );

  List<Pinwino> Pinwinos = [
    new Pinwino(
      id: "111 222 333",
      nombre: "Don Churrumais",
      correo: "",
      password: "",
      victorias: 0,
      derrotas: 0,
      fecha: "28 de Octubre de 2023",
      conectado: true,
      deck: [],
      library: [],
      gorro: "assets/images/hats/cowboy_hat.webp",
      gorros: [
        "assets/images/hats/wizard_hat.webp",
        "assets/images/hats/cowboy_hat.webp",
      ],
      friends: [
        "123 456 789",
      ],
    ),
    new Pinwino(
      id: "333 222 111",
      nombre: "Wellinton Quiw",
      correo: "",
      password: "",
      victorias: 0,
      derrotas: 0,
      fecha: "28 de Octubre de 2023",
      conectado: true,
      deck: [],
      library: [],
      gorro: "assets/images/hats/wizard_hat.webp",
      gorros: [
        "assets/images/hats/wizard_hat.webp",
        "assets/images/hats/cowboy_hat.webp",
      ],
      friends: [
        "123 456 789",
      ],
    ),
    new Pinwino(
      id: "999 888 111",
      nombre: "Xx_rompe_puertas_xX",
      correo: "",
      password: "",
      victorias: 0,
      derrotas: 0,
      fecha: "28 de Octubre de 2023",
      conectado: true,
      deck: [],
      library: [],
      gorro: "assets/images/hats/wizard_hat.webp",
      gorros: [
        "assets/images/hats/wizard_hat.webp",
        "assets/images/hats/cowboy_hat.webp",
      ],
      friends: [
        "123 456 789",
      ],
    ),
  ];

  RoomListBloc() : super(RoomListInitial()) {
    on<GetRoomListEvent>(_getRoomListEvent);
  }

  FutureOr<void> _getRoomListEvent(RoomListEvent event, Emitter emit) {
    //TODO: De la base de datos real obtener primero los AMIGOS CONECTADOS

    List<Pinwino> Pinwins = Pinwinos;
    List<bool> friends = [true, false, true];
    print('Holowos');
    print('Holiwis');
    emit(GetRoomListState(RoomPinwinos: Pinwins, RoomFriends: friends));
  }
}
