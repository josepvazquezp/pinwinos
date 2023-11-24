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
  bool _sigin = false;
  Pinwino user = new Pinwino(gorros: [], friends: []);

  List<dynamic> _deck = [
    "KYBoJDS6UTyEjyZ2ETAN",
    "MJRSAvSLFBItkVHGX4Y3",
    "2BielJ6bafSuIbxF3Pa8",
    "kRUOW10BAFyaTFK5gl1Z",
    "cRIqVb0eZYVU0arkDtAC",
    "iklIRsRuiZy6YWdRlzqW",
    "nam73FVuji40HacrDHML",
    "fkhlSJ1L71dbqSQsPjOe",
    "lTytILCKxZwQAsW6nYw7",
    "CmX9xHMD9v8oFJovpWQg",
  ];

  List<dynamic> _library = [
    "8MZf4LHiystTmfqNR674",
    "EyUQ0FOpXRpr9643TcOd",
    "BMRw71d1LdFscy5sEKGy",
    "3zvkVVb31WPEAdA6w9ZF",
    "kMUbqBmSbEtGtiY2rtb3",
    "CBrHhenE0K7UsZUag4VY",
    "MF1OG95zjFg64r3sVgsL",
    "FjYmEVwsGbvv1AtxkfpD",
    "gyltw2seOhOTfoWolp7S",
    "J2iUPtxfL7F5Nb1ahh8m",
    "KDndRPyJJ7FV4nWPCyk4",
    "baKT99j5DViU4RWjo82Q",
    "CneI9IiasQG85ayogy3X",
    "mZmLmOjyzkkxitwh2NXm",
    "Kbw9BXKv7ISDHPY3BiQ4",
    "89yCDEs0sVI2siIqZy1u",
    "C4SDNVzCQmlTOxKVxOLo",
    "sMMN6vBJj3JHfYhCsfod",
    "50NegXgt3KzXrxqBm2nV",
    "JR94rUAcbspQhKbaozOd",
    "b0OPDHfveXbl1LOyLBVg",
    "YEtydOd1zZ7ckV9GhOgh",
    "YCp5ixB1luuCCr70KlY1",
    "VjrYWn0AFKAZEI3ap1Wv",
    "2TJO0GiWhNgCxRczbtbw",
    "pgXlFPe7b6ko4ef35lDJ",
    "dPbaAYau7FIshAhp2Blv",
    "NQguYK8EeJi5Gq1mlHO5",
    "47I7anY3lHX3bJhb21t5",
  ];

  List<String> _hats = [
    "assets/images/hats/wizard_hat.webp",
    "assets/images/hats/cowboy_hat.webp",
    "assets/images/hats/cap.webp",
    "assets/images/hats/kirby_hat.png",
    "assets/images/hats/mario_hat.png",
    "assets/images/hats/sailor_hat.webp",
    "assets/images/hats/top_hat.png",
  ];

  bool get getLogin => _login;
  bool get getSigIn => _sigin;
  Pinwino get getPinwino => user;

  LoginBloc() : super(LoginInitial()) {
    on<GetUserEvent>(_getUserLogin);
    on<CreateUserEvent>(_createUserRegister);
    on<LogoutEvent>(_logoutEvent);
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

      await FirebaseFirestore.instance
          .collection('pinwinos')
          .doc(userInfo.docs.first.id)
          .update({"connected": true});

      List<Carta> userDeck =
          await userDeck_Library(userInfo.docs.first.data()["deck"]);
      List<Carta> userLibrary =
          await userDeck_Library(userInfo.docs.first.data()["library"]);

      user = new Pinwino(
        id: userInfo.docs.first.id,
        nombre: userInfo.docs.first.data()["name"],
        correo: userInfo.docs.first.data()["email"],
        password: userInfo.docs.first.data()["password"],
        victorias: userInfo.docs.first.data()["wins"],
        derrotas: userInfo.docs.first.data()["loses"],
        fecha: userInfo.docs.first.data()["sign_date"].toString(),
        conectado: true,
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

        // insert en colección
        var newPenwin = {
          "name": event.name,
          "email": event.mail,
          "password": event.password,
          "connected": true,
          "friends": [],
          "hat": "",
          "hats": _hats,
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

        List<Carta> userDeck = await userDeck_Library(userInfo.data()!["deck"]);
        List<Carta> userLibrary =
            await userDeck_Library(userInfo.data()!["library"]);

        user = new Pinwino(
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
        _sigin = true;
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

  Future<List<Carta>> userDeck_Library(List<dynamic> list) async {
    List<Carta> tempList = [];
    Carta temp;
    var getCard;

    for (int i = 0; i < list.length; i++) {
      getCard = await FirebaseFirestore.instance
          .collection('cards')
          .doc(list[i])
          .get();

      temp = new Carta(
        id: list[i],
        imagen: getCard.data()["imagen"],
        numero: getCard.data()["numero"],
        color: getCard.data()["color"],
        elemento: getCard.data()["elemento"],
        poder: getCard.data()["poder"],
        poder_imagen: getCard.data()["poder_imagen"],
      );

      tempList.add(temp);
    }

    return tempList;
  }

  FutureOr<void> _logoutEvent(LogoutEvent event, Emitter emit) async {
    await FirebaseFirestore.instance
        .collection('pinwinos')
        .doc(user.id)
        .update({"connected": false});

    _login = false;
    emit(LogoutState());
  }
}
