import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/gameblock.dart';
import 'package:flutter_block_bingo/component/gameboard.dart';

import '../blockbingo_util.dart';

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

bool isBlockVaildCheck(
    GameBlock gameBlock, GameBoard gameBoard, Offset offset) {
  return true;
}

class _GameBoardState extends State<GameBoardWidget> {
  // blockSize Singleton util init
  bool initBoxSize = true;
  String _text = "aaaaa";
  GlobalKey _boardKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // blockSize Singleton util init
    if (initBoxSize) {
      BlockBingoUtilSingleTon().boxSize = min(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height) /
          5;
      initBoxSize = false;
    }

    print('_GameBoardState Build!!!');
    int blockOpacityLength = widget.gameBoard.blockOpacity.length;
    int colorIdx = 0;

    Widget _board = Center(
      child: Container(
          key: _boardKey,
          color: Colors.yellow,
          // decoration: BoxDecoration(
          //   border: Border(),
          // ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_text),
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
                          width: BlockBingoUtilSingleTon().boxSize,
                          height: BlockBingoUtilSingleTon().boxSize,
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
        print('onAccept');
        // // addGameBlock()
        // setState(() {
        //   addGameBlock(widget.gameBoard, data);
        // });
      },
      onAcceptWithDetails: (DragTargetDetails<GameBlock> details) {
        print('=========================');
        print(BlockBingoUtilSingleTon().boxSize.toString());
        print(details.data is GameBlock);
        print(details.offset.dx);
        print(details.offset.dy);
        RenderBox? _boardBox =
            _boardKey.currentContext?.findRenderObject() as RenderBox?;
        Offset boardOffset =
            _boardBox?.localToGlobal(Offset.zero) ?? Offset.zero;

        print(boardOffset.dx.toString() + ' ::: ' + boardOffset.dy.toString());
        print(context.size!.width.toString() +
            ' : ' +
            context.size!.height.toString());

        print('onAcceptDetails');
        setState(() {
          addGameBlock(widget.gameBoard, details.data);
          _text = " [ " +
              details.offset.dx.toString() +
              " : " +
              details.offset.dy.toString() +
              " ] dx:dy";
        });
      },
      builder: (context, candidateData, rejectedData) => _board,
      onWillAccept: (data) {
        print('onWillAccept');

        if (data is! GameBlock) return false;

        // if (data.po)
        return true;
      },
    );
  }
}
