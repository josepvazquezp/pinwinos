import 'package:flutter/material.dart';
import 'package:pinwinos/models/carta.dart';

class BattleCard extends StatelessWidget {
  final Carta card;
  final int index;
  final bool usable;

  const BattleCard(
      {super.key,
      required this.card,
      required this.index,
      required this.usable});

  @override
  Widget build(BuildContext context) {
    void _tempo(int? nombre, String? path) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('${nombre}'),
              content: Container(
                height: 100,
                width: 100,
                child: Image.asset("${path}"),
              ),
            );
          });
    }

    return Container(
      child: Stack(
        children: [
          Container(
            height: 130,
            width: 100,
            child: Image.asset(
              card.imagen!,
              fit: BoxFit.fill,
            ),
          ),
          if (card.poder != "")
            Positioned(
              right: 10,
              child: Container(
                height: 20,
                color: Color.fromARGB(48, 66, 66, 66),
                child: Image.asset(
                  card.poder_imagen!,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
