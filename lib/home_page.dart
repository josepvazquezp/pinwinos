import 'package:flutter/material.dart';
import 'package:pinwinos/deck_edition_page.dart';
import 'package:pinwinos/login_page.dart';
import 'package:pinwinos/rules_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dojo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Image.asset(
                        "assets/images/friends.png",
                        height: 50,
                      ),
                    ),
                    Text(
                      "Amiwinos",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DeckEditionPage(),
                        ));
                      },
                      child: Image.asset(
                        "assets/images/deck.png",
                        height: 50,
                      ),
                    ),
                    Text(
                      "Deck",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 50,
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(98, 96, 125, 139),
                    child: Column(
                      children: [
                        Text(
                          'Pinwinos en',
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontFamily: "BUMBASTIKA",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tamaulipas',
                          style: TextStyle(
                            fontSize: 38,
                            color: Color.fromARGB(255, 255, 225, 35),
                            fontFamily: "BUMBASTIKA",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.345,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          color: Color.fromARGB(255, 36, 53, 70),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Pinwino VS CPU",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          color: Color.fromARGB(255, 36, 53, 70),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Pinwino VS Pinwino",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.qr_code_scanner),
                      color: Colors.white,
                      iconSize: 35,
                    ),
                    Text(
                      "QR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RulesPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/info.png",
                        height: 50,
                      ),
                    ),
                    Text(
                      "Info.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
