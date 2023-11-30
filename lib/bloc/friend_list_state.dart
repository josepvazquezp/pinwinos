part of 'friend_list_bloc.dart';

sealed class FriendListState extends Equatable {
  const FriendListState();

  @override
  List<Object> get props => [];
}

final class FriendListInitial extends FriendListState {}

final class FriendListDisplayState extends FriendListState {
  final Pinwino user;

  FriendListDisplayState({required this.user});

  @override
  List<Object> get props => [user];
}

final class UpgradingFriendsState extends FriendListState {}

final class FriendDoesntExistsState extends FriendListState {}

final class FriendAlreadyState extends FriendListState {}

final class FriendAddedState extends FriendListState {}

final class NoFriendsState extends FriendListState {}
