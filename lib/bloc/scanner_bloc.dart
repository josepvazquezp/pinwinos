import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  String code_data = '';
  Pinwino? user;

  void set_user(Pinwino ruser) {
    user = ruser;
  }

  ScannerBloc() : super(ScannerInitial()) {
    on<ScanCodeEvent>(_scanCodeEvent);
    on<GetCodeDataEvent>(_getCodeDataEvent);
    on<UnlockGivenEvent>(_unlockGivenEvent);
    on<CancelErrorEvent>(_cancelErrorEvent);
    on<UnexistantDataEvent>(_unexistantDataEvent);
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

  FutureOr<void> _unexistantDataEvent(ScannerEvent event, Emitter emit) {
    emit(UnexistantDataState());
  }

  Future<FutureOr<void>> _getCodeDataEvent(
      ScannerEvent event, Emitter emit) async {
    Carta selected_card;
    var docs_ref;
    try {
      var query_channel =
          FirebaseFirestore.instance.collection('cards').doc("${code_data}");

      docs_ref = await query_channel.get();
    } catch (e) {
      print(e.toString());
    }

    if (docs_ref.data() != null) {
      print("=================================");
      print("Datos de consulta");
      print(docs_ref.data());
      print("=================================");

      selected_card = Carta(
          color: docs_ref.data()["color"],
          elemento: docs_ref.data()["elemento"],
          imagen: docs_ref.data()["imagen"],
          numero: docs_ref.data()["numero"],
          poder: docs_ref.data()["poder"],
          poder_imagen: docs_ref.data()["poder_imagen"]);

      try {
        if (user!.library!.contains(selected_card)) {
          emit(GetCodeDataState(
              item:
                  "${selected_card.color} ${selected_card.numero} ${selected_card.elemento}",
              item_image: selected_card.imagen!,
              unlocked: 'Ya tenias:'));
        } else {
          //users_library.add(code_data);

          try {
            await FirebaseFirestore.instance
                .collection('pinwinos')
                .doc(user!.id)
                .update({"library": user!.library!});

            emit(GetCodeDataState(
                item:
                    "${selected_card.color} ${selected_card.numero} ${selected_card.elemento}",
                item_image: selected_card.imagen!,
                unlocked: 'Has desbloqueado:'));
          } catch (e) {
            print(e.toString());
          }
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("El ID dado no corresponde a una carta");
      add(UnexistantDataEvent());
    }
  }

  FutureOr<void> _unlockGivenEvent(ScannerEvent event, Emitter emit) {
    emit(WaitingScanState());
  }
}
