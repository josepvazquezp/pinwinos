import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'room_list_event.dart';
part 'room_list_state.dart';

class RoomListBloc extends Bloc<RoomListEvent, RoomListState> {
  String my_room_id = "";

  Pinwino? player;

  RoomListBloc() : super(RoomListInitial()) {
    on<LoadUserForRoomEvent>(_load_user_for_room);
    on<GetRoomListEvent>(_getRoomListEvent);
    on<ReadyToBattleEvent>(_ready_to_battle);
  }

  FutureOr<void> _load_user_for_room(LoadUserForRoomEvent event, Emitter emit) {
    player = event.user;
    add(GetRoomListEvent());
  }

  void add_to_room(Map<dynamic, dynamic> room, String room_id) {
    print("Se va a unir a:");
    print(room);

    if (room["pinwino_1"] == "") {
      room["pinwino_1"] = player!.id;
    } else {
      room["pinwino_2"] = player!.id;
      room["available"] = false;
    }
    my_room_id = room_id;

    FirebaseFirestore.instance.collection("rooms").doc(room_id).update(
      {
        "available": room["available"],
        "pinwino_1": room["pinwino_1"],
        "pinwino_2": room["pinwino_2"],
      },
    );

    // if (!room["available"]) {
    //   add(ReadyToBattleEvent(
    //     pinwino_1: room["pinwino_1"],
    //     pinwino_2: room["pinwino_2"],
    //     room_id: room_id,
    //   ));
    // }
  }

  FutureOr<void> _ready_to_battle(ReadyToBattleEvent event, Emitter emit) {
    print("===================================================");
    print("Usuarios listos para pelear");
    print("===================================================");
    emit(ReadyToBattleState(
      pinwino_1: event.pinwino_1,
      pinwino_2: event.pinwino_2,
      room_id: event.room_id,
    ));
  }

  FutureOr<void> _getRoomListEvent(RoomListEvent event, Emitter emit) {
    emit(GetRoomListState(RoomPinwinos: [], RoomFriends: []));
  }

  bool verify_room(String ver_room_id) {
    return (my_room_id == ver_room_id) ? true : false;
  }

  _listen_room_changes() async {
    StreamSubscription? _suscripcion;

    FirebaseFirestore.instance
        .collection('rooms')
        .doc("alasa basa")
        .snapshots()
        .listen((snapshot) {
      //Aqui va lo que se hace cuando se hace el listen
      print("Snapshot");
      print(snapshot);
    });
  }
}
