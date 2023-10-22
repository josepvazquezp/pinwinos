part of 'scanner_bloc.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

final class ScannerInitial extends ScannerState {}

final class WaitingScanState extends ScannerState {}

final class ScaningCodeState extends ScannerState {}

final class ErrorDataState extends ScannerState {}

final class UnexistantDataState extends ScannerState {}

final class GetCodeDataState extends ScannerState {
  final String unlocked;
  final String item;
  final String item_image;

  GetCodeDataState(
      {required this.unlocked, required this.item, required this.item_image});

  @override
  List<Object> get props => [unlocked, item, item_image];
}
