import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/game_block.dart';
import 'package:flutter_block_bingo/component/game_block_widget.dart';
import 'package:flutter_block_bingo/component/game_board.dart';
import 'package:flutter_block_bingo/component/gameboard_provider.dart';
import 'package:flutter_block_bingo/constant.dart';
import 'package:flutter_block_bingo/blockbingo_util.dart';
import 'package:provider/provider.dart';

import 'component/game_board_widget.dart';

class MainGame extends StatefulWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  _MainGameState createState() => _MainGameState();
}

final List<GameBlockWidget> _gameblocklist = [];
final GameBoardWidget _gameBoardWidget =
    GameBoardWidget(gameBoard: GameBoard(boxSizeX: 3, boxSizeZ: 3));

/// GameData init
/// that gameblocklist,
initGameData() {
  for (int i = 0; i < BLOCK_USEABLE_COUNT; i++) {
    _gameblocklist.add(
      GameBlockWidget(
        gameBlock: GameBlock(),
      ),
    );
  }
}

/// Change new item in GameBlockList
changeListNewBlock(idx) {
  _gameblocklist.removeAt(idx);
  _gameblocklist.insert(
    idx,
    GameBlockWidget(
      gameBlock: GameBlock(),
    ),
  );
}

/// Dragable Block for Feedback
Widget feedBackBlockGet(idx, context) {
  BlockBingoUtilSingleTon().setBoxSizeforContext(context);
  return _gameblocklist.length < idx
      ? Container()
      : SizedBox(
          width: 50,
          height: 50,
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned(
              left: idx * -70.0,
              top: -200,
              child: Opacity(
                opacity: 0.33,
                child: GameBlockWidget(
                  gameBlock: GameBlock(
                    blockBoxSize: BlockBingoUtilSingleTon().boxSize,
                    blockTypeNumber:
                        _gameblocklist[idx].gameBlockGet.blockTypeNumber,
                  ),
                ),
              ),
            ),
          ]),
        );
}

class _MainGameState extends State<MainGame> {
  @override
  void initState() {
    super.initState();
    initGameData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Column(
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
                            // _gameblocklist[0] = GameBlockWidget(
                            //   gameBlock: GameBlock(),
                            // );
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
                child: Container(child: _gameBoardWidget),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int listIdx = 0;
                                  listIdx < _gameblocklist.length;
                                  listIdx++)
                                Draggable(
                                  child: _gameblocklist[listIdx],

                                  onDragCompleted: () {
                                    print('Drag Completed!!');
                                    setState(() {
                                      // _gameBoardWidget.gameBoard.addGameBlock(
                                      //     _gameblocklist[listIdx].gameBlock!);
                                      changeListNewBlock(listIdx);
                                    });
                                  },
                                  // feedback: Container(),
                                  feedback: feedBackBlockGet(listIdx, context),
                                  data: _gameblocklist[listIdx].gameBlockGet,
                                ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    for (int i = 0;
                                        i < _gameblocklist.length;
                                        i++) {
                                      setState(() {
                                        _gameblocklist[i]
                                            .gameBlock
                                            ?.rotationBlock();
                                      });
                                    }
                                  },
                                ),
                              )
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
        ),
      ],
    );
  }
}
