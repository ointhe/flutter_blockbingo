import 'package:flutter/material.dart';

import '../util.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

List<Widget> getForLoopWidget(int size, dynamic T) {
  List<Widget> resultList = [];
  if (T is Row) {
    for (var i = 0; i < size; i++) {
      resultList.add(Row());
    }
  } else if (T is Column) {
    for (var i = 0; i < size; i++) {
      resultList.add(Column());
    }
  }
  return resultList;
}

Widget getGameBoard({GameModes gameMode = GameModes.Normal}) {
  int _boardSize = 3;

  return Row(children: getForLoopWidget(_boardSize, Column()));
}

class _GameBoardState extends State<GameBoard> {
  var gameBoardNomalMode = Row(
    children: [Column()],
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),

        // 3col
        child: Column(
          children: [
            // top bar
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Score',
                      ),
                    ),
                    flex: 9,
                  ),
                  Expanded(
                    child: Icon(Icons.settings),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Center(
                    child: gameBoardNomalMode,
                  ),
                  SizedBox(height: 10.0, width: 10.0),
                  Text('aa'),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  SizedBox(height: 10.0, width: 10.0),
                  Text('bb'),
                ],
              ),
            ),
          ],
        ));
  }
}
