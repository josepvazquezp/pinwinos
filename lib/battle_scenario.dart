import 'package:flutter/material.dart';

class BattleScenario extends StatelessWidget {
  const BattleScenario({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    String FireIcon = 'assets/images/elements/fire_icon.webp';
    String WaterIcon = 'assets/images/elements/water_icon.webp';
    String SnowIcon = 'assets/images/elements/snow_icon.webp';
    String Snowball = 'assets/images/elements/Snowball.webp';

    String ProfilePic = 'assets/images/profile.png';

    List<String> Images = [
      'assets/images/cards/c1.png',
      'assets/images/cards/c2.png',
      'assets/images/cards/c3.png',
      'assets/images/cards/c4.png',
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                '$FireIcon',
                                fit: BoxFit.fill,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                '$WaterIcon',
                                fit: BoxFit.fill,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                '$SnowIcon',
                                fit: BoxFit.fill,
                              )),
                        )
                      ],
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        '$ProfilePic',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 130,
                      width: 100,
                      child: Image.asset(
                        '${Images[2]}',
                        fit: BoxFit.fill,
                      ),
                    )
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
                    Container(
                      height: 130,
                      width: 100,
                      child: Image.asset(
                        '${Images[0]}',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ), //Carta seleccionada 2
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              '$SnowIcon',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              '$SnowIcon',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              '$SnowIcon',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        '$ProfilePic',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ), //Aqui van los pinwinos
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: ScreenHeight * 0.35,
                  width: ScreenWidth,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 50),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 130,
                              width: 100,
                              child: Image.asset(
                                '${Images[index]}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ), //Aqui van las cartas
        ],
      ),
    );
  }
}
