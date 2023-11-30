import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinwinos/bloc/friend_list_bloc.dart';
import 'package:pinwinos/bloc_deck_edition/deck_edition_bloc.dart';
import 'package:pinwinos/bloc/profile_bloc.dart';
import 'package:pinwinos/bloc/room_list_bloc.dart';
import 'package:pinwinos/bloc/scanner_bloc.dart';
import 'package:pinwinos/bloc_deck_game/deck_game_bloc.dart';
import 'package:pinwinos/bloc_game/game_bloc.dart';
import 'package:pinwinos/bloc_login/login_bloc.dart';
import 'package:pinwinos/firebase_options.dart';
import 'package:pinwinos/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FriendListBloc(),
      ),
      BlocProvider(
        create: (context) => DeckEditionBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc()..add(CheckAuthEvent()),
      ),
      BlocProvider<RoomListBloc>(
        create: (context) => RoomListBloc(),
      ),
      BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
      ),
      BlocProvider<ScannerBloc>(
        create: (context) => ScannerBloc()..add(UnlockGivenEvent()),
      ),
      BlocProvider(
        create: (context) => GameBloc(),
      ),
      BlocProvider<DeckGameBloc>(
        create: (context) => DeckGameBloc(),
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
      debugShowCheckedModeBanner: false,
    );
  }
}
