import 'package:flutter/material.dart';
import 'package:pinwinos/penwin_view.dart';

class RoomMenu extends StatelessWidget {
  RoomMenu({super.key});

  final List<Map<String, String>> Pinwins = [
    {
      "Nombre": "Paco",
      "Conectado": "1",
      "Amigo": "1",
    },
    {
      "Nombre": "Raul",
      "Conectado": "1",
      "Amigo": "1",
    },
    {
      "Nombre": "XxKillerxX",
      "Conectado": "1",
      "Amigo": "1",
    },
    {
      "Nombre": "Caguamaster",
      "Conectado": "1",
      "Amigo": "0",
    },
  ];

  int PenwinQuantity = 4;

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
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: PenwinQuantity,
                  itemBuilder: (BuildContext context, int index) {
                    return Column();
                  },
                ),
              ),
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
    ;
  }
}
