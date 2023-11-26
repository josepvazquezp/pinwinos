import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/friend_list_bloc.dart';
import 'package:pinwinos/bloc_login/login_bloc.dart';
import 'package:pinwinos/models/pinwino.dart';
import 'package:pinwinos/penwin_view.dart';
import 'package:share_plus/share_plus.dart';

class FriendList extends StatefulWidget {
  FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  var friend_id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/FriendList.webp"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(198, 33, 149, 243),
                      ),
                      child: Text(
                        ' Amiwos ',
                        style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  BlocBuilder<FriendListBloc, FriendListState>(
                      builder: (context, state) {
                    if (state is FriendListDisplayState) {
                      BlocProvider.of<LoginBloc>(context).user = state.user;
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: FirestoreListView(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          pageSize: 15,
                          query: FirebaseFirestore.instance
                              .collection('pinwinos')
                              .where(FieldPath.documentId,
                                  whereIn: state.user.friends),
                          itemBuilder: (BuildContext context,
                              QueryDocumentSnapshot<Map<String, dynamic>>
                                  document) {
                            return PenwinView(
                                Pinwin: Pinwino(
                                  nombre: document.data()["name"],
                                  conectado: document.data()["connected"],
                                  gorro: document.data()["hat"],
                                  gorros: [],
                                  friends: [],
                                ),
                                isFriend: true);
                          },
                        ),
                      );
                    } else if (state is UpgradingFriendsState) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FriendDoesntExistsState) {
                      Future.microtask(() => _display_friend_doesnt_exists());
                    } else if (state is FriendAddedState) {
                      Future.microtask(() => _display_friend_added());
                    } else if (state is FriendAlreadyState) {
                      Future.microtask(() => _display_friend_already());
                    } else if (state is NoFriendsState) {
                      return _no_friends();
                    }

                    return _error();
                  }),
                  Padding(
                    padding: EdgeInsets.only(right: 4, left: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          color: Colors.cyan,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Volver',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 32),
                            ),
                          ),
                        ),
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          color: Colors.cyan,
                          child: MaterialButton(
                            onPressed: () {
                              _display_add_friend_field();
                            },
                            child: Text(
                              'Agregar Amigo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 32),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title:
                                          Text("Se esta enviando tu solicitud"),
                                      content: Image.asset(
                                          "assets/images/friend_request_animation.webp"),
                                    );
                                  },
                                );

                                await Share.share(
                                  "Aqui tienes mi ID de Pinwinos en Tamaulipas:\n${BlocProvider.of<FriendListBloc>(context).player!.id}",
                                );
                              },
                              child: Image.asset(
                                "assets/images/friends.png",
                                height: 50,
                              ),
                            ),
                            Container(
                              color: Color.fromARGB(230, 144, 160, 175),
                              child: Text(
                                "Compartir Codigo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _display_add_friend_field() {
    showDialog(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              Center(
                child: AlertDialog(
                  title: Text(
                    'Agregar Amigo',
                  ),
                  content: Column(
                    children: [
                      TextField(
                        controller: friend_id,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Ingrese el ID del Pinwino...'),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          BlocProvider.of<FriendListBloc>(context)
                              .add(AddingFriendsEvent(id: friend_id.text));
                          friend_id.text = "";
                          Navigator.of(context).pop();
                        },
                        color: Colors.cyan,
                        child: Text(
                          "Agregar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _display_friend_added() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
                title: Text(
                  'Amiwo Agregado',
                ),
                content: Text("Se ha agregado al amiwo con exito!!")),
          );
        });
  }

  void _display_friend_already() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
                title: Text(
                  'Ya agregado',
                ),
                content: Text("Este pinwino ya era tu amigo")),
          );
        });
  }

  void _display_friend_doesnt_exists() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
                title: Text(
                  'Alerta',
                ),
                content: Text("No se encontro el Pinwino con el ID dado")),
          );
        });
  }

  Widget _no_friends() {
    return Container(
      alignment: Alignment.center,
      width: 450,
      height: 80,
      color: Colors.cyan,
      child: Text(
        "No hay amigos para mostrar",
        style: TextStyle(color: Colors.white, fontSize: 34),
      ),
    );
  }

  Widget _error() {
    return Text('No se pudieron obtener los amigos');
  }
}
