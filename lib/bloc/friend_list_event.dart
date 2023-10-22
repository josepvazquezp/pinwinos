part of 'friend_list_bloc.dart';

sealed class FriendListEvent extends Equatable {
  const FriendListEvent();

  @override
  List<Object> get props => [];
}

class GetFriendsEvent extends FriendListEvent {}
