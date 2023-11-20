import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //TODO: Este ID esta hardcodeado; Cambiarlo cuando Login Funcione
  String user_id = "xbyAPohJyUdK8g6xnGuF";

  Pinwino? player;

  String? get getGorro => player!.gorro;
  List<Carta>? get getDeck => player!.deck;
  int get getDeckLength => (getDeck!.length ~/ 2).toInt();

  Future<void> setGorro(String? neogorro) async {
    player!.gorro = neogorro;
    await FirebaseFirestore.instance
        .collection('pinwinos')
        .doc(user_id)
        .update({"hat": neogorro});

    add(HatChangedEvent());
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<GetDataEvent>(_getDataEvent);
    on<HatChangedEvent>(_getDataEvent);
  }

  Future<FutureOr<void>> _getDataEvent(ProfileEvent event, Emitter emit) async {
    var query_user =
        FirebaseFirestore.instance.collection('pinwinos').doc(user_id);
    var user_res = await query_user.get();

    print("Datos de usuario");
    print(user_res.data()!["deck"][0]);

    List<Carta> users_deck = [];

    //Poblada del Deck si se guardan solo los IDs en los arreglos de Firebase
    for (int i = 0; i < user_res.data()!["deck"].length; i++) {
      var card_res = await FirebaseFirestore.instance
          .collection('cartas')
          .doc(user_res.data()!["deck"][i])
          .get();
      users_deck.add(
        Carta(
          color: card_res.data()!["color"],
          elemento: card_res.data()!["elemento"],
          imagen: card_res.data()!["imagen"],
          numero: card_res.data()!["numero"],
          poder: card_res.data()!["poder"],
          poder_imagen: card_res.data()!["poder_imagen"],
        ),
      );
    }

    print("Fecha De union");
    print(user_res.data()!["sign_date"]);

    player = Pinwino(
      conectado: user_res.data()!["connected"],
      correo: user_res.data()!["email"],
      deck: users_deck,
      derrotas: user_res.data()!["loses"],
      fecha: "Ayer",
      gorro: user_res.data()!["hat"],
      id: user_res.id,
      nombre: user_res.data()!["name"],
      victorias: user_res.data()!["wins"],
      gorros: user_res.data()!["hats"].cast<String>(),
      friends: user_res.data()!["friends"].cast<String>(),
    );

    emit(ProfileDataGetState(pinwin: player!));
  }
}
