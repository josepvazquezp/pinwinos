import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/battle_scenario.dart';
import 'package:pinwinos/bloc/room_list_bloc.dart';
import 'package:pinwinos/bloc_game/game_bloc.dart';
import 'package:pinwinos/models/pinwino.dart';
import 'package:pinwinos/penwin_view.dart';

class RoomMenu extends StatefulWidget {
  RoomMenu({super.key});

  @override
  State<RoomMenu> createState() => _RoomMenuState();
}

class _RoomMenuState extends State<RoomMenu> {
  void _showWaitDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Conectando a la Sala...'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Esperando oponente...',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CircularProgressIndicator()
                ],
              ));
        });
  }

  void _showBattleDialog(String room_id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Lista Sala ${room_id}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Creando campo de juego...',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CircularProgressIndicator()
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/FightRoom.webp"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(198, 33, 149, 243),
                  ),
                  child: Text(
                    'Elige un Oponente',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
              BlocBuilder<RoomListBloc, RoomListState>(
                  builder: (context, state) {
                if (state is GetRoomListState) {
                  return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("rooms")
                        .doc("dXtJHHn6mgwUPZqcLkdl")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        if (!snapshot.data!.data()!["available"]) {
                          print(snapshot.data!.data()!["available"]);
                          print(
                              "=====================================================");
                          print("SE HA CONCRETADO UNA BATALLA");
                          print(
                              "=====================================================");
                          if (BlocProvider.of<RoomListBloc>(context)
                              .verify_room("dXtJHHn6mgwUPZqcLkdl")) {
                            print("Snapshot");
                            print(snapshot.data!.data());

                            BlocProvider.of<GameBloc>(context).add(
                                GetUserBattleEvent(
                                    p1: BlocProvider.of<RoomListBloc>(context)
                                        .player!));

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _navigateToBattleScenario(context);
                            });
                          } else {
                            return Text(
                              "Batalla en progreso",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                              ),
                            );
                          }
                        } else {
                          return room_display(
                              snapshot.data!.data()!, snapshot.data!.id);
                        }
                      }
                      return Column();
                    },
                  );
                } else {
                  return Container();
                }
              }),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  color: Colors.cyan,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToBattleScenario(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BattleScenario(),
      ),
    );
  }

  Widget room_display(Map<dynamic, dynamic> document, String id_s) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          if (document["available"]) {
            BlocProvider.of<RoomListBloc>(context).add_to_room(document, id_s);
            _showWaitDialog();
          } else {
            print("===================================");
            print("ALERTA");
            print("===================================");
            print("Este room ya esta ocupado");
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 420,
              height: 100,
              color: Colors.white,
            ),
            Container(
              width: 400,
              height: 80,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Room ID: ${id_s}\nRoom Number: ${document["number"]}\nAvailable: ${document["available"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _error() {
    return Text('No se pudieron obtener combatientes');
  }
}
