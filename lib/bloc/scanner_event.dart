part of 'scanner_bloc.dart';

sealed class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class ScanCodeEvent extends ScannerEvent {}

class CancelErrorEvent extends ScannerEvent {}

//TODO: Implementar este caso para cuando no se encuentre algo en la base de datos
class UnexistantDataEvent extends ScannerEvent {}

class GetCodeDataEvent extends ScannerEvent {}

class UnlockGivenEvent extends ScannerEvent {}
