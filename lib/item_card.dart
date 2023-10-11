import 'package:flutter/material.dart';
import 'package:pinwinos/models/carta.dart';

class ItemCard extends StatelessWidget {
  final Carta card;
  ItemCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 100,
            child: Image.asset(
              card.imagen!,
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
