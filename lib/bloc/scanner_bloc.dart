import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  String code_data = '';

  ScannerBloc() : super(ScannerInitial()) {
    on<ScanCodeEvent>(_scanCodeEvent);
    on<GetCodeDataEvent>(_getCodeDataEvent);
    on<UnlockGivenEvent>(_unlockGivenEvent);
    on<CancelErrorEvent>(_cancelErrorEvent);
  }

  void setCodeData(String new_code_data) {
    if (new_code_data == '-1') {
      add(CancelErrorEvent());
      return;
    }

    code_data = new_code_data;
    add(GetCodeDataEvent());
  }

  FutureOr<void> _scanCodeEvent(ScannerEvent event, Emitter emit) {
    emit(ScanCodeEvent());
  }

  FutureOr<void> _cancelErrorEvent(ScannerEvent event, Emitter emit) {
    emit(ErrorDataState());
  }

  FutureOr<void> _getCodeDataEvent(ScannerEvent event, Emitter emit) {
    emit(GetCodeDataState(
        item: 'Gorra',
        item_image: 'assets/images/hats/cap.webp',
        unlocked: 'Has desbloqueado:'));
  }

  FutureOr<void> _unlockGivenEvent(ScannerEvent event, Emitter emit) {
    emit(WaitingScanState());
  }
}
