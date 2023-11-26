import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/friend_list_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/bloc/profile_bloc.dart';
import 'package:pinwinos/bloc/room_list_bloc.dart';
import 'package:pinwinos/bloc/scanner_bloc.dart';
import 'package:pinwinos/bloc_deck_game/deck_game_bloc.dart';
import 'package:pinwinos/bloc_game/game_bloc.dart';
import 'package:pinwinos/bloc_login/login_bloc.dart';
import 'package:pinwinos/firebase_options.dart';
import 'package:pinwinos/home_page.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

Pinwino _pt = new Pinwino(
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FriendListBloc(),
      ),
      BlocProvider(
        create: (context) => DeckEditionBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc()..add(CheckAuthEvent()),
      ),
      BlocProvider<RoomListBloc>(
        create: (context) => RoomListBloc()..add(GetRoomListEvent()),
      ),
      BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
      ),
      BlocProvider<ScannerBloc>(
        create: (context) => ScannerBloc()..add(UnlockGivenEvent()),
      ),
      BlocProvider(
        create: (context) => GameBloc(),
      ),
      BlocProvider<DeckGameBloc>(
        create: (context) => DeckGameBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
