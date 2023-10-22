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
