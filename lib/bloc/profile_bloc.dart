import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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

  String? get getGorro => player.gorro;

  void setGorro(String? neogorro) {
    player.gorro = neogorro;
    add(HatChangedEvent());
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<GetDataEvent>(_getDataEvent);
    on<HatChangedEvent>(_getDataEvent);
  }

  FutureOr<void> _getDataEvent(ProfileEvent event, Emitter emit) {
    emit(ProfileDataGetState(pinwin: player));
  }
}
