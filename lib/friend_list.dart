import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/friend_list_bloc.dart';
import 'package:pinwinos/models/pinwino.dart';
import 'package:pinwinos/penwin_view.dart';

class FriendList extends StatefulWidget {
  FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
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
                      return _showFriends(state.FriendList);
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
                        Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
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
                              },
                              child: Image.asset(
                                "assets/images/friends.png",
                                height: 50,
                              ),
                            ),
                            Container(
                              color: Color.fromARGB(230, 144, 160, 175),
                              child: Text(
                                "Agregar Amiwino",
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

  Widget _showFriends(List<Pinwino> PlayerFriendList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: PlayerFriendList.length,
        itemBuilder: (BuildContext context, int index) {
          return PenwinView(
            Pinwin: PlayerFriendList[index],
            isFriend: true,
          );
        },
      ),
    );
  }

  Widget _error() {
    return Text('No se pudieron obtener los amigos');
  }
}
