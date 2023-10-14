import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/models/carta.dart';

class ItemCard extends StatelessWidget {
  final Carta card;
  final bool deck;
  final int index;

  ItemCard(
      {super.key, required this.card, required this.deck, required this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (deck) {
          BlocProvider.of<DeckEditionBloc>(context)
              .add(AddCardLibraryEvent(index: index));
        } else {
          BlocProvider.of<DeckEditionBloc>(context)
              .add(AddCardDeckEvent(index: index));
        }
      },
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
