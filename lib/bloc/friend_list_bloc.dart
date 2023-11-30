import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'friend_list_event.dart';
part 'friend_list_state.dart';

class FriendListBloc extends Bloc<FriendListEvent, FriendListState> {
  Pinwino? player;

  FriendListBloc() : super(FriendListInitial()) {
    on<GetFriendsEvent>(_getFriendsEvent);
    on<AddingFriendsEvent>(_add_friends);
    on<FriendsLoadUserEvent>(_friends_load_user_data);

    on<FriendDoesntExistsEvent>(_friend_doesnt_exists);
    on<FriendAlreadyEvent>(_friend_already);
    on<FriendAddedEvent>(_friend_added);
  }

  FutureOr<void> _friends_load_user_data(
      FriendsLoadUserEvent event, Emitter emit) {
    player = event.user;
    print("AMIGOS DEL USUARIO");
    print(player!.friends);
    add(GetFriendsEvent());
  }

  FutureOr<void> _friend_doesnt_exists(
      FriendDoesntExistsEvent event, Emitter emit) async {
    emit(FriendDoesntExistsState());
    await Future.delayed(Duration(seconds: 3));
    add(GetFriendsEvent());
  }

  FutureOr<void> _friend_already(FriendAlreadyEvent event, Emitter emit) async {
    emit(FriendAlreadyState());
    await Future.delayed(Duration(seconds: 3));
    add(GetFriendsEvent());
  }

  FutureOr<void> _friend_added(FriendAddedEvent event, Emitter emit) async {
    emit(FriendAddedState());
    await Future.delayed(Duration(seconds: 3));
    add(GetFriendsEvent());
  }

  FutureOr<void> _add_friends(AddingFriendsEvent event, Emitter emit) async {
    emit(UpgradingFriendsState());
    print("ID RECIBIDO");
    print(event.id);
    add_friend(event.id);
  }

  FutureOr<void> _getFriendsEvent(FriendListEvent event, Emitter emit) async {
    if (player!.friends.isEmpty) {
      print("Sin amigos");
      emit(NoFriendsState());
    } else {
      print("Tiene amigos");
      emit(FriendListDisplayState(user: player!));
    }
  }

  void add_friend(String id) async {
    print("ID A BUSCAR");
    print(id);

    var res =
        await FirebaseFirestore.instance.collection('pinwinos').doc(id).get();

    if (res.data() != null) {
      if (player!.friends.contains(id)) {
        //Ya esta agregado
        print("El pinwino ya es amigo");
        add(FriendAlreadyEvent());
      } else {
        //No esta agregado
        print("El pinwino aun no es amigo");
        player!.friends.add(id);
        print(player!.friends);

        await FirebaseFirestore.instance
            .collection("pinwinos")
            .doc(player!.id)
            .update({"friends": player!.friends});

        await FirebaseFirestore.instance.collection("pinwinos").doc(id).set({
          "friends": FieldValue.arrayUnion([player!.id])
        }, SetOptions(merge: true));

        add(FriendAddedEvent());
      }
    } else {
      print("No existe ese Pinwino");
      add(FriendDoesntExistsEvent());
    }
  }
}
