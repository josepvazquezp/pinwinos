import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  String code_data = '';
  String user_id = "xbyAPohJyUdK8g6xnGuF";

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
    List<String> cards_id = [];
    var docs_ref;
    try {
      var query_channel = FirebaseFirestore.instance.collection('cartas');

      docs_ref = await query_channel.get();

      for (int i = 0; i < docs_ref.size; i++) {
        cards_id.add(docs_ref.docs[i].id);
      }

      print("Lista de IDs");
      print(cards_id);
    } catch (e) {
      print(e.toString());
    }

    //TODO: Se traba en este if pero cuando se le da seguir avanza como si nada
    if (cards_id.contains(code_data)) {
      try {
        var query_user =
            FirebaseFirestore.instance.collection('pinwinos').doc(user_id);

        var user_res = await query_user.get();

        if (user_res.exists) {
          List<dynamic> users_library = user_res.data()!["library"];

          if (users_library.contains(code_data)) {
            for (int i = 0; i < docs_ref.size; i++) {
              if (docs_ref.docs[i].id == code_data) {
                emit(GetCodeDataState(
                    item:
                        "${docs_ref.docs[i].data()["color"]} ${docs_ref.docs[i].data()["numero"]} ${docs_ref.docs[i].data()["elemento"]}",
                    item_image: docs_ref.docs[i].data()["imagen"],
                    unlocked: 'Ya tenias:'));
              }
            }
          } else {
            users_library.add(code_data);

            try {
              await FirebaseFirestore.instance
                  .collection('pinwinos')
                  .doc(user_id)
                  .update({"library": users_library});

              for (int i = 0; i < docs_ref.size; i++) {
                if (docs_ref.docs[i].id == code_data) {
                  emit(GetCodeDataState(
                      item:
                          "${docs_ref.docs[i].data()["color"]} ${docs_ref.docs[i].data()["numero"]} ${docs_ref.docs[i].data()["elemento"]}",
                      item_image: docs_ref.docs[i].data()["imagen"],
                      unlocked: 'Has desbloqueado:'));
                }
              }
            } catch (e) {
              print(e.toString());
            }
          }
        } else {
          //Aqui no deberia de llegar nunca porque sin login no jala
          print("No se encontro al usuario");
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
