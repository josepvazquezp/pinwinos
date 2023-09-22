import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var mailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_register_back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blueGrey[800],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Color.fromARGB(178, 201, 196, 172),
                        child: TextField(
                          controller: mailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey[700]!,
                                width: 2,
                              ),
                            ),
                            label: Text(
                              "Ingresa el correo",
                              style: TextStyle(color: Colors.blueGrey[700]),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outlined,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                          style: TextStyle(color: Colors.brown[800]),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Color.fromARGB(178, 201, 196, 172),
                        child: TextField(
                          controller: mailController,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey[700]!,
                                width: 2,
                              ),
                            ),
                            label: Text(
                              "Ingresa tu contraseña",
                              style: TextStyle(color: Colors.blueGrey[700]),
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                          style: TextStyle(color: Colors.brown[800]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Color.fromARGB(255, 201, 196, 172),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blueGrey[800],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Registrar",
                          style: TextStyle(
                            color: Color.fromARGB(255, 201, 196, 172),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.brown[800],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
