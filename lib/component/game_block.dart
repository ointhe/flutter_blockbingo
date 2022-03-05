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
  final _rotaionConstListIdx = [2, 5, 8, 1, 4, 7, 0, 3, 6];
  List<bool> blockType = [];

  /// RotaionBlock to left once
  rotationBlock() {
    if (blockType.length == 9) {
      for (int i = 0; i < blockType.length; i++) {
        bool tempBool = blockType[i];
        blockType[i] = blockType[_rotaionConstListIdx[i]];
        blockType[_rotaionConstListIdx[i]] = tempBool;
      }
    }
  }

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
