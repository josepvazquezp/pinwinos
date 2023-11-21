import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinwinos/models/carta.dart';
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

  List<dynamic> _deck = [
    {
      "imagen": "assets/images/cards/c1.png",
      "numero": 3,
      "color": "blue",
      "elemento": "fire",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c2.png",
      "numero": 6,
      "color": "purple",
      "elemento": "fire",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c3.png",
      "numero": 2,
      "color": "yellow",
      "elemento": "fire",
      "poder": "",
      "poder_imagen": ""
    },
    {
      "imagen": "assets/images/cards/c4.png",
      "numero": 3,
      "color": "orange",
      "elemento": "snow",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c5.png",
      "numero": 2,
      "color": "red",
      "elemento": "snow",
      "poder": "",
      "poder_imagen": ""
    },
    {
      "imagen": "assets/images/cards/c6.png",
      "numero": 7,
      "color": "yellow",
      "elemento": "snow",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c7.png",
      "numero": 5,
      "color": "blue",
      "elemento": "water",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c8.png",
      "numero": 2,
      "color": "green",
      "elemento": "water",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c9.png",
      "numero": 4,
      "color": "purple",
      "elemento": "water",
      "poder": "",
      "poder_imagen": "",
    },
    {
      "imagen": "assets/images/cards/c10.png",
      "numero": 10,
      "color": "yellow",
      "elemento": "fire",
      "poder": "1_9",
      "poder_imagen": "assets/images/elements/1_9_effect.png",
    },
  ];

  List<dynamic> _library = [
    {
      "imagen": "assets/images/cards/c11.png",
      "numero": 10,
      "color": "yellow",
      "elemento": "water",
      "poder": "1_9",
      "poder_imagen": "assets/images/elements/1_9_effect.png",
    },
    {
      "imagen": "assets/images/cards/c12.png",
      "numero": 10,
      "color": "yellow",
      "elemento": "snow",
      "poder": "1_9",
      "poder_imagen": "assets/images/elements/1_9_effect.png",
    },
    {
      "imagen": "assets/images/cards/c13.png",
      "numero": 12,
      "color": "red",
      "elemento": "fire",
      "poder": "+2",
      "poder_imagen": "assets/images/elements/plus_2.png",
    },
    {
      "imagen": "assets/images/cards/c14.png",
      "numero": 12,
      "color": "orange",
      "elemento": "snow",
      "poder": "+2",
      "poder_imagen": "assets/images/elements/plus_2.png",
    },
    {
      "imagen": "assets/images/cards/c15.png",
      "numero": 12,
      "color": "purple",
      "elemento": "water",
      "poder": "+2",
      "poder_imagen": "assets/images/elements/plus_2.png",
    },
    {
      "imagen": "assets/images/cards/c16.png",
      "numero": 12,
      "color": "blue",
      "elemento": "fire",
      "poder": "-2",
      "poder_imagen": "assets/images/elements/remove_2.png",
    },
    {
      "imagen": "assets/images/cards/c17.png",
      "numero": 12,
      "color": "orange",
      "elemento": "snow",
      "poder": "-2",
      "poder_imagen": "assets/images/elements/remove_2.png",
    },
    {
      "imagen": "assets/images/cards/c18.png",
      "numero": 12,
      "color": "yellow",
      "elemento": "water",
      "poder": "-2",
      "poder_imagen": "assets/images/elements/remove_2.png",
    },
    {
      "imagen": "assets/images/cards/c19.png",
      "numero": 10,
      "color": "orange",
      "elemento": "fire",
      "poder": "-snow",
      "poder_imagen": "assets/images/elements/bye_snow_random.png",
    },
    {
      "imagen": "assets/images/cards/c20.png",
      "numero": 10,
      "color": "green",
      "elemento": "snow",
      "poder": "-water",
      "poder_imagen": "assets/images/elements/bye_water_random.png",
    },
    {
      "imagen": "assets/images/cards/c21.png",
      "numero": 10,
      "color": "orange",
      "elemento": "water",
      "poder": "-fire",
      "poder_imagen": "assets/images/elements/bye_fire_random.png",
    },
    {
      "imagen": "assets/images/cards/c22.png",
      "numero": 11,
      "color": "purple",
      "elemento": "fire",
      "poder": "-red",
      "poder_imagen": "assets/images/elements/bye_red_random.png",
    },
    {
      "imagen": "assets/images/cards/c23.png",
      "numero": 11,
      "color": "purple",
      "elemento": "water",
      "poder": "-blue",
      "poder_imagen": "assets/images/elements/bye_blue_random.png",
    },
    {
      "imagen": "assets/images/cards/c24.png",
      "numero": 11,
      "color": "purple",
      "elemento": "snow",
      "poder": "-green",
      "poder_imagen": "assets/images/elements/bye_green_random.png",
    },
    {
      "imagen": "assets/images/cards/c25.png",
      "numero": 11,
      "color": "green",
      "elemento": "fire",
      "poder": "-yellow",
      "poder_imagen": "assets/images/elements/bye_yellow_random.png",
    },
    {
      "imagen": "assets/images/cards/c26.png",
      "numero": 11,
      "color": "green",
      "elemento": "water",
      "poder": "-orange",
      "poder_imagen": "assets/images/elements/bye_orange_random.png",
    },
    {
      "imagen": "assets/images/cards/c27.png",
      "numero": 11,
      "color": "yellow",
      "elemento": "snow",
      "poder": "-purple",
      "poder_imagen": "assets/images/elements/bye_purple_random.png",
    },
    {
      "imagen": "assets/images/cards/c28.png",
      "numero": 11,
      "color": "blue",
      "elemento": "fire",
      "poder": "-all_red",
      "poder_imagen": "assets/images/elements/bye_all_red.png",
    },
    {
      "imagen": "assets/images/cards/c29.png",
      "numero": 10,
      "color": "yellow",
      "elemento": "fire",
      "poder": "-all_blue",
      "poder_imagen": "assets/images/elements/bye_all_blue.png",
    },
    {
      "imagen": "assets/images/cards/c30.png",
      "numero": 12,
      "color": "orange",
      "elemento": "fire",
      "poder": "-all_green",
      "poder_imagen": "assets/images/elements/bye_all_green.png",
    },
    {
      "imagen": "assets/images/cards/c31.png",
      "numero": 10,
      "color": "purple",
      "elemento": "water",
      "poder": "-all_yellow",
      "poder_imagen": "assets/images/elements/bye_all_yellow.png",
    },
    {
      "imagen": "assets/images/cards/c32.png",
      "numero": 9,
      "color": "purple",
      "elemento": "snow",
      "poder": "-all_orange",
      "poder_imagen": "assets/images/elements/bye_all_orange.png",
    },
    {
      "imagen": "assets/images/cards/c33.png",
      "numero": 10,
      "color": "green",
      "elemento": "snow",
      "poder": "-all_purple",
      "poder_imagen": "assets/images/elements/bye_all_purple.png",
    },
    {
      "imagen": "assets/images/cards/c34.png",
      "numero": 9,
      "color": "red",
      "elemento": "fire",
      "poder": "block_snow",
      "poder_imagen": "assets/images/elements/block_snow.png",
    },
    {
      "imagen": "assets/images/cards/c35.png",
      "numero": 9,
      "color": "blue",
      "elemento": "water",
      "poder": "block_fire",
      "poder_imagen": "assets/images/elements/block_fire.png",
    },
    {
      "imagen": "assets/images/cards/c36.png",
      "numero": 9,
      "color": "orange",
      "elemento": "snow",
      "poder": "block_water",
      "poder_imagen": "assets/images/elements/block_water.png",
    },
    {
      "imagen": "assets/images/cards/c37.png",
      "numero": 9,
      "color": "blue",
      "elemento": "fire",
      "poder": "water->fire",
      "poder_imagen": "assets/images/elements/change_water_fire.png",
    },
    {
      "imagen": "assets/images/cards/c38.png",
      "numero": 9,
      "color": "blue",
      "elemento": "water",
      "poder": "snow->water",
      "poder_imagen": "assets/images/elements/change_snow_water.png",
    },
    {
      "imagen": "assets/images/cards/c39.png",
      "numero": 9,
      "color": "blue",
      "elemento": "water",
      "poder": "fire->snow",
      "poder_imagen": "assets/images/elements/change_fire_snow.png",
    },
  ];

  bool get getLogin => _login;
  Pinwino get getPinwino => _user;

  LoginBloc() : super(LoginInitial()) {
    on<GetUserEvent>(_getUserLogin);
    on<CreateUserEvent>(_createUserRegister);
  }

  FutureOr<void> _getUserLogin(GetUserEvent event, Emitter emit) async {
    emit(LoadLoginState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.mail, password: event.password);

      var userInfo = await FirebaseFirestore.instance
          .collection('pinwinos')
          .where("email", isEqualTo: "${event.mail}")
          .get();

      List<Carta> userDeck =
          userDeck_Library(userInfo.docs.first.data()["deck"]);
      List<Carta> userLibrary =
          userDeck_Library(userInfo.docs.first.data()["library"]);

      _user = new Pinwino(
        id: userInfo.docs.first.id,
        nombre: userInfo.docs.first.data()["name"],
        correo: userInfo.docs.first.data()["email"],
        password: userInfo.docs.first.data()["password"],
        victorias: userInfo.docs.first.data()["wins"],
        derrotas: userInfo.docs.first.data()["loses"],
        fecha: userInfo.docs.first.data()["sign_date"].toString(),
        conectado: userInfo.docs.first.data()["connected"],
        deck: userDeck,
        library: userLibrary,
        gorro: userInfo.docs.first.data()["hat"],
        gorros: userInfo.docs.first.data()["hats"].cast<String>(),
        friends: userInfo.docs.first.data()["friends"].cast<String>(),
      );

      _login = true;
      emit(GetUserSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      _login = false;
      emit(ErrorState());
    }
  }

  FutureOr<void> _createUserRegister(
      CreateUserEvent event, Emitter emit) async {
    emit(LoadLoginState());

    if (event.name != "" && event.mail != "" && event.password != "") {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.mail,
          password: event.password,
        );
        // await credential.user!getIdToken();

        // insert en colección
        var newPenwin = {
          "name": event.name,
          "email": event.mail,
          "password": event.password,
          "connected": true,
          "friends": [],
          "hat": "",
          "hats": [],
          "loses": 0,
          "wins": 0,
          "sign_date": DateTime.now(),
          "deck": _deck,
          "library": _library
        };

        var docRef = await FirebaseFirestore.instance
            .collection('pinwinos')
            .add(newPenwin);

        // obtener pinwino en base a lo insertado
        var userInfo = await FirebaseFirestore.instance
            .collection('pinwinos')
            .doc(docRef.id)
            .get();

        List<Carta> userDeck = userDeck_Library(userInfo.data()!["deck"]);
        List<Carta> userLibrary = userDeck_Library(userInfo.data()!["library"]);

        _user = new Pinwino(
          id: docRef.id,
          nombre: userInfo.data()!["name"],
          correo: userInfo.data()!["email"],
          password: userInfo.data()!["password"],
          victorias: userInfo.data()!["wins"],
          derrotas: userInfo.data()!["loses"],
          fecha: userInfo.data()!["sign_date"].toString(),
          conectado: userInfo.data()!["connected"],
          deck: userDeck,
          library: userLibrary,
          gorro: userInfo.data()!["hat"],
          gorros: userInfo.data()!["hats"].cast<String>(),
          friends: userInfo.data()!["friends"].cast<String>(),
        );

        _login = true;
        emit(GetUserSuccessState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
        _login = false;
        emit(ErrorState());
      } catch (e) {
        print(e);
        _login = false;
        emit(ErrorState());
      }
    } else {
      _login = false;
      emit(ErrorState());
    }
  }

  List<Carta> userDeck_Library(List<dynamic> list) {
    List<Carta> tempList = [];
    Carta temp;

    for (int i = 0; i < list.length; i++) {
      temp = new Carta(
        imagen: list[i]["imagen"],
        numero: list[i]["numero"],
        color: list[i]["color"],
        elemento: list[i]["elemento"],
        poder: list[i]["poder"],
        poder_imagen: list[i]["poder_imagen"],
      );

      tempList.add(temp);
    }

    return tempList;
  }
}
