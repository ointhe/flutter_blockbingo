import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/game_block_widget.dart';
import 'package:flutter_block_bingo/util.dart';

import 'component/game_board.dart';

class MainGame extends StatefulWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  _MainGameState createState() => _MainGameState();
}

final List<GameBlockWidget> _gameblocklist = [
  const GameBlockWidget(),
  const GameBlockWidget(),
  const GameBlockWidget(),
];
set gameblocklist(gb) {
  _gameblocklist.add(gb);
}

get gameblocklist => _gameblocklist;

class _MainGameState extends State<MainGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: TextButton(
                    child: Text('Block Bingo'),
                    onPressed: () {
                      setState(() {
                        _gameblocklist[0] = GameBlockWidget();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Center(
            child: DragTarget(
              builder: (context, candidateData, rejectedData) =>
                  const GameBoard(),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: Column(
                    children: [
                      Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Draggable(
                            child: gameblocklist[0],
                            // feedback: Container(),
                            feedback: gameblocklist[0],
                            // feedbackOffset: Offset.fromDirection(2.0),
                          ),
                          Draggable(
                            child: gameblocklist[1],
                            feedback: gameblocklist[1],
                          ),
                          Draggable(
                            child: gameblocklist[2],
                            feedback: gameblocklist[2],
                          ),
                        ],
                      ),
                      Container(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
