part of 'room_list_bloc.dart';

sealed class RoomListState extends Equatable {
  const RoomListState();

  @override
  List<Object> get props => [];
}

final class RoomListInitial extends RoomListState {}

final class GetRoomListState extends RoomListState {
  final List<Pinwino> RoomPinwinos;
  final List<bool> RoomFriends;

  GetRoomListState({required this.RoomPinwinos, required this.RoomFriends});

  @override
  List<Object> get props => [RoomPinwinos, RoomFriends];
}

final class ReadyToBattleState extends RoomListState {
  final String pinwino_1;
  final String pinwino_2;
  final String room_id;

  ReadyToBattleState(
      {required this.pinwino_1,
      required this.pinwino_2,
      required this.room_id});

  @override
  // TODO: implement props
  List<Object> get props => [pinwino_1, pinwino_2, room_id];
}
