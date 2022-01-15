import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/game_board.dart';

///
///  GameBlock :
///   사용자 Object.
class GameBlock extends StatelessWidget {
  // const 생성자로 생성할 시 문제 * maingame.dart 의 List<GameBlock> _gameblocklist의 인스턴스가 호출될때 마다 새로 생성 됨
  // why?
  // const GameBlock({Key? key, this.blockTypeNumber}) : super(key: key);

  GameBlock({Key? key, this.blockTypeNumber, this.blockBoxSize = 25})
      : super(key: key) {
    blockTypeNumber = blockTypeNumber ?? RandomBitNum();
  }

  /// block type for number (1~512)
  int? blockTypeNumber;

  /// 1 block size default 25
  int? blockBoxSize;

  int? getblockTypeNumber() => blockTypeNumber;
  int RandomBitNum() => Random().nextInt(511) + 1;

  List<bool> RandomeBlockTypeGet() {
    List<bool> _blockType = [];
    int _typeNum = blockTypeNumber ?? 0;

    while (_blockType.length < 9) {
      _blockType.add(_typeNum % 2 == 0 ? false : true);
      _typeNum ~/= 2;
    }
    return _blockType;
  }

  @override
  Widget build(BuildContext context) {
    List<bool> _blockTypeList = RandomeBlockTypeGet();

    return Center(
      child: Expanded(
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
                              width: 20,
                              height: 20,
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
                              width: 20,
                              height: 20,
                              // color: Colors.pink,
                            )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
