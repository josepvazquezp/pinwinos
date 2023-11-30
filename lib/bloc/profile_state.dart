part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileWaitingUserState extends ProfileState {}

final class ProfileDataGetState extends ProfileState {
  final Pinwino pinwin;

  ProfileDataGetState({required this.pinwin});

  @override
  List<Object> get props => [pinwin];
}

final class ChangedHatState extends ProfileState {}
