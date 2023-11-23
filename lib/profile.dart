import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/profile_bloc.dart';
import 'package:pinwinos/dual_card_display.dart';
import 'package:pinwinos/models/carta.dart';
import 'package:pinwinos/models/pinwino.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileWaitingUserState) {
          } else if (state is ProfileDataGetState) {
            return _nose(state.pinwin);
          }

          return Column();
        },
      ),
    );
  }

  Widget hat_place(String hat_route) {
    if (hat_route == "") {
      return Column();
    } else {
      return Image.asset('${hat_route}');
    }
  }

  Widget _nose(Pinwino pinwin) {
    String ProfilePic = 'assets/images/profile.png';

    List<Carta> deck = [];

    Color textColor = Colors.white;

    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Profile.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(color: Color.fromARGB(131, 50, 26, 171)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Stack(
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
                            child: hat_place(pinwin.gorro!),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${pinwin.nombre}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                        Text('ID: ${pinwin.id}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                            )),
                      ],
                    ),
                  ],
                ),
                Text('Victorias: ${pinwin.victorias}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Text('Derrotas: ${pinwin.derrotas}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                // Text('Se unio el: ${pinwin.fecha}',
                //     style: TextStyle(
                //       fontSize: 22,
                //       fontWeight: FontWeight.w900,
                //       color: textColor,
                //     )),
                Text('Gorros:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Container(
                  height: 80,
                  width: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pinwin.gorros.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<ProfileBloc>(context)
                                    .setGorro(pinwin.gorros[index]);
                                //TODO: Revisar cual era el widget para quitar este set state
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                color: (pinwin.gorro == pinwin.gorros[index])
                                    ? Colors.green
                                    : Colors.grey,
                                child: Image.asset(
                                  '${pinwin.gorros[index]}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 400,
                color: const Color.fromARGB(115, 33, 149, 243),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Mazo',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          )),
                      Container(
                        height: 300,
                        width: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: BlocProvider.of<ProfileBloc>(context)
                              .getDeckLength,
                          itemBuilder: (BuildContext context, int index) {
                            return DualCardDisplay(
                              CardImages: [
                                BlocProvider.of<ProfileBloc>(context)
                                    .getDeck![index * 2]
                                    .imagen!,
                                BlocProvider.of<ProfileBloc>(context)
                                    .getDeck![index * 2 + 1]
                                    .imagen!
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ), //Aqui va el deck
        ],
      ),
    );
  }
}
