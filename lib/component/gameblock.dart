import 'dart:math';

import '../constant.dart';

class GameBlock {
  GameBlock({this.blockBoxSize = BLOCK_USE_SIZE, this.blockTypeNumber = 0}) {
    RandomeBlockTypeSet();
  }

  /// block type for number (1~512)
  int blockTypeNumber;

  /// 1 block size default [BLOCK_USE_SIZE]25
  num? blockBoxSize;

  /// get Random number(1~512)
  int RandomBitNum() => Random().nextInt(511) + 1;

  List<bool> blockType = [];

  /// Make Block(3x3)
  RandomeBlockTypeSet() {
    // resetList
    blockType = [];

    blockTypeNumber = blockTypeNumber == 0 ? RandomBitNum() : blockTypeNumber;
    int _typeNum = blockTypeNumber;

    while (blockType.length < 9) {
      blockType.add(_typeNum % 2 == 0 ? false : true);
      _typeNum ~/= 2;
    }
  }
}