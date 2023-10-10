import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/friend_list_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FriendListBloc()..add(GetFriendsEvent()),
      ),
      BlocProvider(
        create: (context) => DeckEditionBloc()..add(GetDeckLibraryEvent()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
