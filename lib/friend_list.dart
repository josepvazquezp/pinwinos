import 'package:flutter/material.dart';
import 'package:pinwinos/penwin_view.dart';

class FriendList extends StatelessWidget {
  FriendList({super.key});

  @override
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
      "Nombre": "Tacos al Pastor",
      "Conectado": "0",
      "Amigo": "1",
    },
    {
      "Nombre": "Churrumais",
      "Conectado": "0",
      "Amigo": "1",
    },
  ];

  int PenwinQuantity = 5;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/FriendList.webp"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Amiwos',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: PenwinQuantity,
                  itemBuilder: (BuildContext context, int index) {
                    return PenwinView(Pinwin: Pinwins[index]);
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
                    onPressed: () {},
                    child: Text(
                      'Volver',
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
}
