part of 'friend_list_bloc.dart';

sealed class FriendListState extends Equatable {
  const FriendListState();

  @override
  List<Object> get props => [];
}

final class FriendListInitial extends FriendListState {}

final class FriendListDisplayState extends FriendListState {
  final List<Pinwino> FriendList;

  FriendListDisplayState({required this.FriendList});

  @override
  List<Object> get props => [FriendList];
}
