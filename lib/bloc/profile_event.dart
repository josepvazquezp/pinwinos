part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoadUserEvent extends ProfileEvent {}

class GetDataEvent extends ProfileEvent {}

class HatChangedEvent extends ProfileEvent {}
