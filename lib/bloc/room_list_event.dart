part of 'room_list_bloc.dart';

sealed class RoomListEvent extends Equatable {
  const RoomListEvent();

  @override
  List<Object> get props => [];
}

class GetRoomListEvent extends RoomListEvent {}

class LoadUserForRoomEvent extends RoomListEvent {
  final Pinwino user;

  LoadUserForRoomEvent({required this.user});

  List<Object> get props => [user];
}

class ReadyToBattleEvent extends RoomListEvent {
  final String pinwino_1;
  final String pinwino_2;
  final String room_id;

  ReadyToBattleEvent(
      {required this.pinwino_1,
      required this.pinwino_2,
      required this.room_id});

  @override
  List<Object> get props => [pinwino_1, pinwino_2, room_id];
}
