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
      child: Tooltip(
        message: card.poder,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              child: Image.asset(
                card.imagen!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
