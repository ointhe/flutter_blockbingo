import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/gameblock.dart';
import 'package:flutter_block_bingo/component/game_board_widget.dart';

class GameBlockWidget extends StatelessWidget {
  const GameBlockWidget({
    Key? key,
    this.gameBlock,
  }) : super(key: key);

  final GameBlock? gameBlock;
  get gameBlockGet => gameBlock;
  // initGameBlockWidget() {
  //   gameBlock = gameBlock ?? GameBlock()
  //     ..RandomeBlockTypeSet();
  // }

  @override
  Widget build(BuildContext context) {
    print('GameBlockWidget Build!!!');
    // initGameBlockWidget();
    List<bool> _blockTypeList = gameBlock!.blockType;
    double _blockBoxSize = gameBlock!.blockBoxSize!.toDouble();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (int idx = 0; idx < _blockTypeList.length; idx += 3)
              Row(
                children: [
                  for (int j = 0; j < 3; j++)
                    _blockTypeList[idx + j]
                        ? Container(
                            decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.color,
                              shape: BoxShape.rectangle,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blue,
                                  blurRadius: 1.0,
                                ),
                              ],
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.red,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(1.5),
                              ),
                            ),
                            width: _blockBoxSize,
                            height: _blockBoxSize,
                            // color: Colors.pink,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 1.0,
                                ),
                            // color: Colors.white,
                            // borderRadius: BorderRadius.all(
                            //   Radius.circular(1.5),
                            // ),
                            // ),
                            width: _blockBoxSize,
                            height: _blockBoxSize,
                            // color: Colors.pink,
                          )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
