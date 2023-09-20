import 'package:flutter/material.dart';

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
                    Text("Amiwinos",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 50,
                      ),
                    ),
                    Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/parchment.png"),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Pinwinos en \nTamaulipas',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.345,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            color: Color.fromARGB(255, 165, 156, 139),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Pinwino VS CPU",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22)),
                            color: Color.fromARGB(255, 165, 156, 139),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "Pinwino VS Pinwino",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      onPressed: () {},
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
