import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/room_list_bloc.dart';
import 'package:pinwinos/models/pinwino.dart';
import 'package:pinwinos/penwin_view.dart';

class RoomMenu extends StatefulWidget {
  RoomMenu({super.key});

  @override
  State<RoomMenu> createState() => _RoomMenuState();
}

class _RoomMenuState extends State<RoomMenu> {
  void _showWaitDialog(String? nombre) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Conectando a la Sala'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Por favor espere a ${nombre}...',
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
                  return _loadPinwins(state.RoomPinwinos, state.RoomFriends);
                }

                return _error();
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

  Widget _loadPinwins(List<Pinwino> PinwinList, List<bool> IsFriendList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: PinwinList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                //TODO: Codigo de despliegue de la sala; de mientras un dialogo
                _showWaitDialog(PinwinList[index].nombre);
              },
              child: PenwinView(
                Pinwin: PinwinList[index],
                isFriend: IsFriendList[index],
              ));
        },
      ),
    );
  }

  Widget _error() {
    return Text('No se pudieron obtener combatientes');
  }
}
