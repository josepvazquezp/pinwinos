import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/bloc_login/login_bloc.dart';
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
                  Text(
                    "Editar Deck",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownMenu<String>(
                    initialSelection: "ninguno",
                    controller: findController,
                    requestFocusOnTap: true,
                    onSelected: (elemento) {
                      BlocProvider.of<DeckEditionBloc>(context)
                          .add(FilterCardsEvent(filter: findController.text));
                    },
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                    label: Text(
                      "Filtro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailingIcon:
                        Icon(Icons.arrow_drop_down, color: Colors.white),
                    textStyle: TextStyle(color: Colors.white),
                    leadingIcon: Icon(Icons.search, color: Colors.white),
                    dropdownMenuEntries: [
                      DropdownMenuEntry<String>(
                        value: "fuego",
                        label: "fuego",
                        style: MenuItemButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                      ),
                      DropdownMenuEntry<String>(
                        value: "agua",
                        label: "agua",
                        style: MenuItemButton.styleFrom(
                          foregroundColor: Colors.indigo,
                        ),
                      ),
                      DropdownMenuEntry<String>(
                        value: "nieve",
                        label: "nieve",
                        style: MenuItemButton.styleFrom(
                          foregroundColor: Colors.lightBlue,
                        ),
                      ),
                      DropdownMenuEntry<String>(
                        value: "ninguno",
                        label: "ninguno",
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<DeckEditionBloc>(context)
                          .add(FirebaseUpdatesEvent());
                    },
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
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(
                        //     Icons.share_sharp,
                        //   ),
                        //   color: Color.fromARGB(255, 1, 10, 58),
                        //   iconSize: 35,
                        // ),
                      ],
                    ),
                  ),
                  BlocBuilder<DeckEditionBloc, DeckEditionState>(
                    builder: (context, state) {
                      if (state is DeckLibrayDisplayState) {
                        return _showDeck(state.deck);
                      } else if (state is UpdateDeckLibrayDisplayState) {
                        return _showDeck(state.deck);
                      } else if (state is ErrorDeckLibraryRequestState) {
                        return Text("No se pudo obtener el deck");
                      } else {
                        return _showDeck(
                            BlocProvider.of<DeckEditionBloc>(context).getDeck);
                      }
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<DeckEditionBloc, DeckEditionState>(
              listener: (context, state) {
                if (state is BadCardUpdateState) {
                  _showDenyCardUpdateDialog(context);
                } else if (state is LoadingState) {
                  _showLoadingDialog(context);
                } else if (state is FirebaseUpdateSuccessState) {
                  BlocProvider.of<LoginBloc>(context).user.deck =
                      BlocProvider.of<DeckEditionBloc>(context).getDeck;

                  BlocProvider.of<LoginBloc>(context).user.library =
                      BlocProvider.of<DeckEditionBloc>(context).getLibrary;

                  _scaffoldSuccess(context);

                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is DeckLibrayDisplayState) {
                  return _showLibrary(state.library);
                } else if (state is UpdateDeckLibrayDisplayState) {
                  return _showLibrary(state.library);
                } else if (state is ErrorDeckLibraryRequestState) {
                  return Text("No se pudo obtener la library");
                } else {
                  return _showLibrary(
                      BlocProvider.of<DeckEditionBloc>(context).getLibrary);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _showLibrary(List<Carta> library) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: library.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            card: library[index],
            deck: false,
            index: index,
          );
        },
      ),
    );
  }

  Widget _showDeck(List<Carta> deck) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: deck.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCard(
            card: deck[index],
            deck: true,
            index: index,
          );
        },
      ),
    );
  }

  void _showDenyCardUpdateDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Mensaje"),
          content: Text(
            '''No es posible mover la carta por:
            -> Deck de [9 - 17] cartas.
            -> Cartas sin poder son obligatorias.
            -> Ya tienes una carta con ese poder.
            ''',
          ),
        );
      },
    );

    BlocProvider.of<DeckEditionBloc>(context).add(ChangeStateEvent());
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Guardando Deck"),
          content: Container(
            height: 200,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void _scaffoldSuccess(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Se ha actualizado el deck corectamente",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  }
}
