import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/game_block.dart';

class GameBoard {
  GameBoard({boxSizeX, boxSizeZ}) {
    _boxSizeX = boxSizeX;
    this.boxSizeZ = boxSizeZ;
    for (int i = 0; i < boxSizeX * boxSizeX; i++) {
      blockOpacity.add(0.0);
    }
  }

  /// length of one side of a flat square
  int _boxSizeX = 0;

  int get boxSizeX => _boxSizeX;

  set boxSizeX(int boxSizeX) {
    _boxSizeX = boxSizeX;
  }

  int boxSizeZ = 0;
  List<double> blockOpacity = [];
}

bool addGameBlockToBoard(GameBoard gameBoard, GameBlock gameBlock) {
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
