import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  Pinwino? player;

  String? get getGorro => player!.gorro;
  List<Carta>? get getDeck => player!.deck;
  int get getDeckLength => (getDeck!.length ~/ 2).toInt();

  void set_user(Pinwino ruser) {
    player = ruser;
    print("PLAYER RECIBIDO");
    print(player);
    add(GetDataEvent());
  }

  Future<void> setGorro(String? neogorro) async {
    player!.gorro = neogorro;
    await FirebaseFirestore.instance
        .collection('pinwinos')
        .doc(player!.id)
        .update({"hat": neogorro});

    add(HatChangedEvent());
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoadUserEvent>(_prepare_profile_data_event);
    on<GetDataEvent>(_getDataEvent);
    on<HatChangedEvent>(_getDataEvent);
  }

  Future<FutureOr<void>> _prepare_profile_data_event(
      ProfileEvent event, Emitter emit) async {
    emit(ProfileWaitingUserState());
  }

  Future<FutureOr<void>> _getDataEvent(ProfileEvent event, Emitter emit) async {
    emit(ProfileDataGetState(pinwin: player!));
  }
}
