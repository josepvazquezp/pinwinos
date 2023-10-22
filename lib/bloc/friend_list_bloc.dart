import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'friend_list_event.dart';
part 'friend_list_state.dart';

class FriendListBloc extends Bloc<FriendListEvent, FriendListState> {
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

  List<Pinwino> OtherOnes = [
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

  FriendListBloc() : super(FriendListInitial()) {
    on<GetFriendsEvent>(_getFriendsEvent);
  }

  FutureOr<void> _getFriendsEvent(FriendListEvent event, Emitter emit) {
    //TODO: Todo esto se debe cambiar por el WHERE cuando se tenga la base de datos
    List<Pinwino> TemporalList = [];

    for (int i = 0; i < player.friends.length; i++) {
      if (player.friends[i] == OtherOnes[i].id) {
        TemporalList.add(OtherOnes[i]);
      }
    }

    emit(FriendListDisplayState(FriendList: TemporalList));
  }
}
