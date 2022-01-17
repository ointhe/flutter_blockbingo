import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/gameblock.dart';
import 'package:flutter_block_bingo/component/gameboard.dart';

import '../util.dart';

class GameBoardWidget extends StatefulWidget {
  const GameBoardWidget({
    Key? key,
    required this.gameBoard,
  }) : super(key: key);
  final GameBoard gameBoard;
  @override
  _GameBoardState createState() => _GameBoardState();
}

bool addGameBlock(GameBoard gameBoard, GameBlock gameBlock) {
  //add fail
  if (gameBoard.blockOpacity.length < gameBlock.blockType.length) return false;
  int boardIdx = 0;
  for (var element in gameBlock.blockType) {
    gameBoard.blockOpacity[boardIdx] =
        gameBoard.blockOpacity[boardIdx] > (1.0 - 0.33)
            ? element
                ? 0.0
                : 1.0
            : gameBoard.blockOpacity[boardIdx] + (element ? 0.33 : 0.0);
    boardIdx++;
  }
  return true;
}

class _GameBoardState extends State<GameBoardWidget> {
  @override
  Widget build(BuildContext context) {
    print('_GameBoardState Build!!!');
    int blockOpacityLength = widget.gameBoard.blockOpacity.length;
    int colorIdx = 0;

    Widget _board = Center(
      child: Container(
          // decoration: BoxDecoration(
          //   border: Border(),
          // ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int colI = 0; colI < widget.gameBoard.boxSizeX; colI++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int colI = 0; colI < widget.gameBoard.boxSizeX; colI++)
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            )),
                            color: Colors.red.withOpacity(
                              widget.gameBoard.blockOpacity[
                                  colorIdx < blockOpacityLength
                                      ? colorIdx++
                                      : 0],
                            ),
                          ),
                          width: 70,
                          height: 70,
                          // color: Colors.pink,
                        ),
                      ),
                  ],
                )
            ],
          )),
    );

    return DragTarget(
      onAccept: (GameBlock data) {
        // addGameBlock()
        setState(() {
          addGameBlock(widget.gameBoard, data);
        });
        // context.watch<GameBoard>()
        //   ..addGameBlock(_gameBoardWidget.gameBoard, data);
        // Provider.of<GameBoardProvider>(context)
        //     .addGameBlock(_gameBoardWidget.gameBoard, data);

        print(data.toString() + ':: ON ACCEPT!!');
      },
      builder: (context, candidateData, rejectedData) => _board,
      onWillAccept: (data) {
        if (data is! GameBlock) return false;
        // if (data.po)
        return true;
      },
    );
  }
}
