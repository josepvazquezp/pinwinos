import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  var nameController = TextEditingController();
  var mailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/register_back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Color.fromARGB(150, 47, 51, 61),
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 219, 193, 96),
                        ),
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
                            color: Color.fromARGB(178, 47, 51, 61),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 219, 193, 96),
                                    width: 2,
                                  ),
                                ),
                                label: Text(
                                  "Ingresa piwinombre",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 219, 193, 96),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  color: Color.fromARGB(255, 219, 193, 96),
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 219, 193, 96),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color.fromARGB(178, 47, 51, 61),
                            child: TextField(
                              controller: mailController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 219, 193, 96),
                                    width: 2,
                                  ),
                                ),
                                label: Text(
                                  "Ingresa el correo",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 219, 193, 96),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.mail_outlined,
                                  color: Color.fromARGB(255, 219, 193, 96),
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 219, 193, 96),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color.fromARGB(178, 47, 51, 61),
                            child: TextField(
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 219, 193, 96),
                                    width: 2,
                                  ),
                                ),
                                label: Text(
                                  "Ingresa tu contraseña",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 219, 193, 96)),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Color.fromARGB(255, 219, 193, 96),
                                ),
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 219, 193, 96),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 47, 51, 61),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                  ),
                                  color: Color.fromARGB(255, 229, 231, 246),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Registrar",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 229, 231, 246),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Colors.brown[800],
                              ),
                            ],
                          ),
                        ],
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
