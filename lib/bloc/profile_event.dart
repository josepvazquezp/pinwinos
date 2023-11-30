part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadUserEvent extends ProfileEvent {
  final Pinwino user;

  ProfileLoadUserEvent({required this.user});

  List<Object> get props => [this.user];
}

class GetDataEvent extends ProfileEvent {}

class HatChangedEvent extends ProfileEvent {}
