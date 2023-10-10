import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/item_card.dart';
import 'package:pinwinos/models/carta.dart';

class DeckEditionPage extends StatelessWidget {
  DeckEditionPage({super.key});

  var findController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/deck_back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              color: Color.fromARGB(203, 92, 65, 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.white,
                    iconSize: 48,
                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: findController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        label: Text(
                          "Buscador",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Editar Deck",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_circle_outline_sharp,
                    ),
                    iconSize: 48,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Color.fromARGB(142, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mi Deck",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share_sharp,
                          ),
                          color: Color.fromARGB(255, 1, 10, 58),
                          iconSize: 35,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<DeckEditionBloc, DeckEditionState>(
                    builder: (context, state) {
                      if (state is DeckLibrayDisplayState) {
                        return _showDeck(state.deck);
                      }

                      return Text("No se pudo obtener el deck");
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<DeckEditionBloc, DeckEditionState>(
              builder: (context, state) {
                if (state is DeckLibrayDisplayState) {
                  return _showLibrary(state.library);
                }

                return Text("No se pudo obtener la library");
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _showLibrary(List<Carta> library) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: library.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            card: library[index],
          );
        },
      ),
    );
  }

  Container _showDeck(List<Carta> deck) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: deck.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            card: deck[index],
          );
        },
      ),
    );
  }
}
