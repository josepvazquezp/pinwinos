part of 'friend_list_bloc.dart';

sealed class FriendListEvent extends Equatable {
  const FriendListEvent();

  @override
  List<Object> get props => [];
}

class FriendsLoadUserEvent extends FriendListEvent {
  final Pinwino user;

  FriendsLoadUserEvent({required this.user});
  List<Object> get props => [this.user];
}

class GetFriendsEvent extends FriendListEvent {}

class AddingFriendsEvent extends FriendListEvent {
  final String id;

  AddingFriendsEvent({required this.id});

  List<Object> get props => [this.id];
}

class FriendDoesntExistsEvent extends FriendListEvent {}

class FriendAlreadyEvent extends FriendListEvent {}

class FriendAddedEvent extends FriendListEvent {}
