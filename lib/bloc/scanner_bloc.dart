import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<FutureOr<void>> _getCodeDataEvent(
      ScannerEvent event, Emitter emit) async {
    try {
      var query_channel = FirebaseFirestore.instance.collection('cartas');

      var docs_ref = await query_channel.get();
      List<String> cards_id = [];

      print("QUERY");
      for (int i = 0; i < docs_ref.size; i++) {
        //print(docs_ref.docs[i].data());//Esto es para jalarse todos los datos de la query
        // print("ID");
        // print(docs_ref.docs[i].id);
        cards_id.add(docs_ref.docs[i].id);
      }

      print("Lista de IDs");
      print(cards_id);
    } catch (e) {
      print(e.toString());
    }

    emit(GetCodeDataState(
        item: 'Gorra',
        item_image: 'assets/images/hats/cap.webp',
        unlocked: 'Has desbloqueado:'));
  }

  FutureOr<void> _unlockGivenEvent(ScannerEvent event, Emitter emit) {
    emit(WaitingScanState());
  }
}
