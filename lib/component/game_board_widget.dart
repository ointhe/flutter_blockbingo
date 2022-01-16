import 'package:flutter/material.dart';
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

class _GameBoardState extends State<GameBoardWidget> {
  @override
  Widget build(BuildContext context) {
    int blockOpacityLength = widget.gameBoard.blockOpacity.length;
    int colorIdx = 0;
    return Center(
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
  }
}
