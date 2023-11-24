import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/battle_card.dart';
import 'package:pinwinos/bloc_deck_game/deck_game_bloc.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';
import 'package:pinwinos/bloc_game/game_bloc.dart';

class BattleScenario extends StatelessWidget {
  const BattleScenario({super.key});

  @override
  Widget build(BuildContext context) {
    bool use_card = false;

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

    void _victory_advise() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('HAS GANADO'),
            );
          });
    }

    void _lose_advise() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('HAS PERDIDO'),
            );
          });
    }

    Color get_color(String string_color) {
      switch (string_color) {
        case 'yellow':
          return Colors.yellow;
        case 'purple':
          return Colors.purple;
        case 'blue':
          return Colors.blue;
        case 'green':
          return Colors.green;
        case 'red':
          return Colors.red;
        case 'orange':
          return Colors.orange;
      }

      return Colors.grey;
    }

    Widget hand_display(List<Carta> hand) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hand.length,
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(
            onPressed: () {
              print("Index Out ${index}");
              // _tempo(hand[index].numero, hand[index].imagen);
              if (use_card) {
                print("Index In ${index}");
                BlocProvider.of<GameBloc>(context)
                    .add(PlayCardEvent(card: hand[index]));
              }
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BattleCard(
                      card: hand[index],
                      index: index,
                      usable: use_card,
                    ),
                  ],
                )),
          );
        },
      );
    }

    Map<String, List<String>> _userSlots = {
      "fire": [],
      "water": [],
      "snow": [],
    };

    Map<String, List<String>> _enemySlots = {
      "fire": [],
      "water": [],
      "snow": [],
    };

    String FireIcon = 'assets/images/elements/fire_icon.webp';
    String WaterIcon = 'assets/images/elements/water_icon.webp';
    String SnowIcon = 'assets/images/elements/snow_icon.webp';
    String Snowball = 'assets/images/elements/Snowball.webp';

    Widget hat_place(String hat_route) {
      if (hat_route == "") {
        return Column();
      } else {
        return Image.asset('${hat_route}');
      }
    }

    Widget get_user_slots() {
      return Container(
        height: 100,
        width: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _userSlots['fire']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_userSlots['fire']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$FireIcon',
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _userSlots['snow']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_userSlots['snow']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$SnowIcon',
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _userSlots['water']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_userSlots['water']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$WaterIcon',
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }

    Widget get_enemy_slots() {
      return Container(
        height: 100,
        width: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _enemySlots['fire']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_enemySlots['fire']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$FireIcon',
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _enemySlots['snow']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_enemySlots['snow']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$SnowIcon',
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 100,
              width: 80,
              child: ListView.builder(
                  itemCount: _enemySlots['water']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: get_color(_enemySlots['water']![index])),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          '$WaterIcon',
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    }

    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    String ProfilePic = 'assets/images/profile.png';

    Pinwino _Pinwino_jugador = new Pinwino(
      id: "123 456 789",
      nombre: "Pancho Barraza",
      correo: "caguama@gmail.com",
      password: "jokeis123",
      victorias: 0,
      derrotas: 0,
      fecha: "28 de Octubre de 2023",
      conectado: true,
      deck: [
        new Carta(
          imagen: "assets/images/cards/c1.png",
          numero: 3,
          color: "blue",
          elemento: "fire",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c2.png",
          numero: 6,
          color: "purple",
          elemento: "fire",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c3.png",
          numero: 2,
          color: "yellow",
          elemento: "fire",
          poder: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c4.png",
          numero: 3,
          color: "orange",
          elemento: "snow",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c5.png",
          numero: 2,
          color: "red",
          elemento: "snow",
          poder: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c6.png",
          numero: 7,
          color: "yellow",
          elemento: "snow",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c7.png",
          numero: 5,
          color: "blue",
          elemento: "water",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c8.png",
          numero: 2,
          color: "green",
          elemento: "water",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c9.png",
          numero: 4,
          color: "purple",
          elemento: "water",
          poder: "",
          poder_imagen: "",
        ),
        new Carta(
          imagen: "assets/images/cards/c10.png",
          numero: 10,
          color: "yellow",
          elemento: "fire",
          poder: "1_9",
          poder_imagen: "assets/images/elements/1_9_effect.png",
        ),
      ],
      library: [],
      gorro: "assets/images/hats/cowboy_hat.webp",
      gorros: [
        "assets/images/hats/wizard_hat.webp",
        "assets/images/hats/cowboy_hat.webp",
        "assets/images/hats/cap.webp",
        "assets/images/hats/kirby_hat.png",
        "assets/images/hats/mario_hat.png",
        "assets/images/hats/sailor_hat.webp",
        "assets/images/hats/top_hat.png",
      ],
      friends: [
        "111 222 333",
        "333 222 111",
      ],
    );

    bool checknose = true;

    return Scaffold(
      body: Column(
        children: [
          BlocConsumer<GameBloc, GameState>(
            listener: (context, state) {
              //TODO: Preguntar al profe como triggerear esto bien
              if (checknose) {
                checknose = false;
              }

              if (state is GetUsersSuccessState) {
                // por cambiar
                _Pinwino_jugador.gorro = state.p1Gorro;
                use_card = BlocProvider.of<GameBloc>(context).getPlay;
              } else if (state is EndGameState) {
                if (state.victory) {
                  //Gana el Player 1 : User
                  //TODO: Cuando se quite el dialog que salga de la pantalla
                  Future.microtask(() => _victory_advise());
                } else {
                  Future.microtask(() => _lose_advise());
                }
              }
            },
            builder: (context, state) {
              if (state is GetUsersSuccessState) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/FightStage.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: ScreenHeight * 0.60,
                  width: ScreenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //TODO: Elementos
                          BlocBuilder<GameBloc, GameState>(
                            builder: (context, state) {
                              if (state is GetSlotsState) {
                                print("Recibiendo Slots");
                                _userSlots = state.userSlots;
                                _enemySlots = state.enemySlots;
                                //De esta manera se guardan siempre que haya cambios para que esten presentes
                                //Aunque no sea el estado del Get Slot
                                return get_user_slots();
                              }

                              return get_user_slots();
                            },
                          ),
                          //TODO: Tunear pinwino
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset('$ProfilePic'),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: hat_place(_Pinwino_jugador.gorro!),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<GameBloc, GameState>(
                            builder: (context, state) {
                              if (state is SelectedCardState) {
                                //TODO: no llega aqui
                                print("Carta seleccionada");
                                return Container(
                                  child: BattleCard(
                                    card: state.card,
                                    index: 0,
                                    usable: false,
                                  ),
                                );
                              } else if (state is BattleCardsState) {
                                return Container(
                                  child: BattleCard(
                                    card: state.userCard,
                                    index: 0,
                                    usable: false,
                                  ),
                                );
                              }

                              return Container(
                                height: 130,
                                width: 130,
                              );
                            },
                          ),
                        ],
                      ), //Carta seleccionada 1
                      Stack(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                '$Snowball',
                                fit: BoxFit.fill,
                              )),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            child: Text(
                              '9',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<GameBloc, GameState>(
                            builder: (context, state) {
                              if (state is BattleCardsState) {
                                return Container(
                                  child: BattleCard(
                                    card: state.enemyCard,
                                    index: 0,
                                    usable: false,
                                  ),
                                );
                              }

                              return Container(
                                height: 130,
                                width: 130,
                              );
                            },
                          ),
                        ],
                      ), //Carta seleccionada 2
                      Column(
                        //TODO: elementos enemigo
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<GameBloc, GameState>(
                            builder: (context, state) {
                              if (state is GetSlotsState) {
                                print("Recibiendo Slots");
                                _userSlots = state.userSlots;
                                _enemySlots = state.enemySlots;
                                //De esta manera se guardan siempre que haya cambios para que esten presentes
                                //Aunque no sea el estado del Get Slot
                                return get_enemy_slots();
                              }

                              return get_enemy_slots();
                            },
                          ),
                          //TODO: Tunear pinwino
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                child: Image.asset('$ProfilePic'),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: hat_place(_Pinwino_jugador.gorro!),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FightStage.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: ScreenHeight * 0.60,
                width: ScreenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //TODO: Elementos
                        BlocBuilder<GameBloc, GameState>(
                          builder: (context, state) {
                            if (state is GetSlotsState) {
                              print("Recibiendo Slots");
                              _userSlots = state.userSlots;
                              _enemySlots = state.enemySlots;
                              //De esta manera se guardan siempre que haya cambios para que esten presentes
                              //Aunque no sea el estado del Get Slot
                              return get_user_slots();
                            }

                            return get_user_slots();
                          },
                        ),
                        //TODO: Tunear pinwino
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              child: Image.asset('$ProfilePic'),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: hat_place(_Pinwino_jugador.gorro!),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<GameBloc, GameState>(
                          builder: (context, state) {
                            if (state is SelectedCardState) {
                              //TODO: no llega aqui
                              print("Carta seleccionada");
                              return Container(
                                child: BattleCard(
                                  card: state.card,
                                  index: 0,
                                  usable: false,
                                ),
                              );
                            } else if (state is BattleCardsState) {
                              return Container(
                                child: BattleCard(
                                  card: state.userCard,
                                  index: 0,
                                  usable: false,
                                ),
                              );
                            }

                            return Container(
                              height: 130,
                              width: 130,
                            );
                          },
                        ),
                      ],
                    ), //Carta seleccionada 1
                    Stack(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            child: Image.asset(
                              '$Snowball',
                              fit: BoxFit.fill,
                            )),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<GameBloc, GameState>(
                          builder: (context, state) {
                            if (state is BattleCardsState) {
                              return Container(
                                child: BattleCard(
                                  card: state.enemyCard,
                                  index: 0,
                                  usable: false,
                                ),
                              );
                            }

                            return Container(
                              height: 130,
                              width: 130,
                            );
                          },
                        ),
                      ],
                    ), //Carta seleccionada 2
                    Column(
                      //TODO: elementos enemigo
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<GameBloc, GameState>(
                          builder: (context, state) {
                            if (state is GetSlotsState) {
                              print("Recibiendo Slots");
                              _userSlots = state.userSlots;
                              _enemySlots = state.enemySlots;
                              //De esta manera se guardan siempre que haya cambios para que esten presentes
                              //Aunque no sea el estado del Get Slot
                              return get_enemy_slots();
                            }

                            return get_enemy_slots();
                          },
                        ),
                        //TODO: Tunear pinwino
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              child: Image.asset('$ProfilePic'),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: hat_place(_Pinwino_jugador.gorro!),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ); //Aqui van los pinwinos
            },
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/StageFloor.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: ScreenHeight * 0.40,
            width: ScreenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: ScreenHeight * 0.35,
                  width: ScreenWidth,
                  child: BlocBuilder<GameBloc, GameState>(
                    //TODO: Preguntar si esta es la manera correcta de acceder al estado\
                    //TODO: Ver porque a veces entra y aveces no

                    builder: (context, state) {
                      if (BlocProvider.of<GameBloc>(context)
                          .get_userGameBloc
                          .state is GetHandState) {
                        print(
                            "Estado ${BlocProvider.of<GameBloc>(context).get_userGameBloc.state}");
                        return hand_display(
                          BlocProvider.of<GameBloc>(context)
                              .get_userGameBloc
                              .getActualHand,
                        );
                      }
                      if (BlocProvider.of<GameBloc>(context)
                          .get_userGameBloc
                          .state is UpdateGetHandState) {
                        print(
                            "Estado ${BlocProvider.of<GameBloc>(context).get_userGameBloc.state}");
                        return hand_display(
                          BlocProvider.of<GameBloc>(context)
                              .get_userGameBloc
                              .getActualHand,
                        );
                      }
                      return Text(
                        "NO HAY MANO",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      );
                    },
                  ),
                ),
              ],
            ),
          ), //Aqui van las cartas
        ],
      ),
    );
  }
}
