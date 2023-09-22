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
                                  children: [],
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
