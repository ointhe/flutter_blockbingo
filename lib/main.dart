import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_block_bingo/component/game_block_widget.dart';
import 'package:flutter_block_bingo/component/gameboard_provider.dart';
import 'package:flutter_block_bingo/blockbingo_util.dart';
import 'package:provider/provider.dart';

import 'component/game_board_widget.dart';
import 'maingame.dart';

void main() {
  runApp(const MyApp());

  // runApp(MultiProvider(
  //   providers: [
  //     Provider<GameBoardProvider>(
  //       create: (_) => GameBoardProvider(),
  //     ),
  //   ],
  //   child: MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
        title: 'aaaa',
        home: Scaffold(
          appBar: null,
          body: MainGame(),
        ));
  }
}
