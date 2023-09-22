import 'package:flutter/material.dart';
import 'package:pinwinos/dual_card_display.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    String Name = 'Pedro Paramo';
    String ID = '123456789';
    int Wins = 99;
    int Loses = 101;
    String Join = '29/09/2023';
    String ProfilePic = 'assets/images/profile.png';

    List<String> Images = [
      'assets/images/cards/c1.png',
      'assets/images/cards/c2.png',
      'assets/images/cards/c3.png',
      'assets/images/cards/c4.png',
      'assets/images/cards/c5.png',
      'assets/images/cards/c6.png',
      'assets/images/cards/c7.png',
      'assets/images/cards/c8.png',
      'assets/images/cards/c9.png',
      'assets/images/cards/c10.png',
      'assets/images/cards/c11.png',
      'assets/images/cards/c12.png'
    ];

    List<String> Hats = [
      'assets/images/hats/cowboy-hat-png.webp',
    ];

    Color textColor = Colors.white;

    return Scaffold(
      body: Container(
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
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        width: 120,
                        height: 120,
                        child: Image.asset('$ProfilePic'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                        Text('ID: $ID',
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
                Text('Victorias: $Wins',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Text('Derrotas: $Loses',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Text('Se unio el: $Join',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Text('Gorros:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    )),
                Container(
                  height: 80,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              color: const Color.fromARGB(255, 219, 219, 219),
                              child: Image.asset(
                                '${Hats[0]}',
                                fit: BoxFit.fill,
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
            Column(
              children: [
                Container(
                  color: const Color.fromARGB(115, 33, 149, 243),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Mazo Favorito',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height - 100,
                          width: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return DualCardDisplay(
                                CardImages: [
                                  Images[index * 2],
                                  Images[(index * 2) + 1]
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
      ),
    );
  }
}
