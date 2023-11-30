import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc_login/login_bloc.dart';
import 'package:pinwinos/register_page.dart';

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
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is GetUserSuccessState) {
              Navigator.of(context).pop();
              _scaffoldSuccess(context);

              if (BlocProvider.of<LoginBloc>(context).getSigIn) {
                Navigator.of(context).pop();
              }
            } else if (state is ErrorState) {
              _scaffoldError(context);
            }
          },
          builder: (context, state) {
            if (state is LoadLoginState) {
              return CircularProgressIndicator();
            }

            return _loginBoxes(context);
          },
        ),
      ),
    );
  }

  void _scaffoldSuccess(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Se ha ingresado corectamente",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  }

  void _scaffoldError(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Error pinwinesco por:\n-> Los datos ingresados son incorrectos\n-> Falta de llenar uno de los campo\n-> No hay conexión de internet",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
  }

  Widget _loginBoxes(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
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
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Color.fromARGB(178, 201, 196, 172),
                        child: TextField(
                          controller: passController,
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
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              BlocProvider.of<LoginBloc>(context).add(
                                  GetUserEvent(
                                      mail: mailController.text,
                                      password: passController.text));
                            },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 47, 51, 61),
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                              ),
                              color: Color.fromARGB(255, 186, 191, 179),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
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
      ],
    );
  }
}
