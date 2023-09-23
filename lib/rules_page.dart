import 'package:flutter/material.dart';

class RulesPage extends StatelessWidget {
  RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/rules_back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                ),
                Column(
                  children: [
                    Text(
                      "Bienvenido aprendiz, deja te explico las reglas",
                      style: TextStyle(
                        fontFamily: "Handmade",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "del juego",
                      style: TextStyle(
                        fontFamily: "Handmade",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 240,
                          width: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nieve derrota Agua",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/snow_icon.webp"),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt_outlined,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/water_icon.webp"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Agua derrota Fuego",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/water_icon.webp"),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt_outlined,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/fire_icon.webp"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Fuego derrota Nieve",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/fire_icon.webp"),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_right_alt_outlined,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/elements/snow_icon.webp"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Text(
                                  "Efectos de cartas",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/elements/1_9_effect.png"),
                                    ),
                                    Text(
                                      "La carta con el # más bajo gana",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/elements/plus_2.png"),
                                    ),
                                    Text(
                                      "El # de tu carta aumenta por 2",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/elements/remove_2.png"),
                                    ),
                                    Text(
                                      "El # del enemigo disminuye por 2",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_red_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_blue_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_yellow_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_green_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_orange_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_purple_random.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Elimina un slot de cierto color del contrincante",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_red.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_blue.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_yellow.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_green.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_orange.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_all_purple.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Elimina todos los slot de cierto color del contrincante",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_fire_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_water_random.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/bye_snow_random.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Elimina un slot de cierto elemento",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 100,
                                        child: Image.asset(
                                            "assets/images/elements/change_fire_snow.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 100,
                                        child: Image.asset(
                                            "assets/images/elements/change_snow_water.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        width: 100,
                                        child: Image.asset(
                                            "assets/images/elements/change_water_fire.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Cambia ese elemento para ambos",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/block_fire.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/block_water.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Container(
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/elements/block_snow.png"),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Bloquea cierto elemento para ambos",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
