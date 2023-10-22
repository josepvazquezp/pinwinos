import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool _login = false;
  Pinwino _user = new Pinwino(
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

  bool get getLogin => _login;
  Pinwino get getPinwino => _user;

  LoginBloc() : super(LoginInitial()) {
    on<GetUserEvent>(_getUserLogin);
    on<CreateUserEvent>(_createUserRegister);
  }

  FutureOr<void> _getUserLogin(GetUserEvent event, Emitter emit) {
    emit(LoadLoginState());

    if (event.mail != "" && event.password != "") {
      _login = true;
      emit(GetUserSuccessState());
    } else {
      _login = false;
      emit(ErrorState());
    }
  }

  FutureOr<void> _createUserRegister(CreateUserEvent event, Emitter emit) {
    emit(LoadLoginState());

    if (event.name != "" && event.mail != "" && event.password != "") {
      _login = true;
      emit(GetUserSuccessState());
    } else {
      _login = false;
      emit(ErrorState());
    }
  }
}
