import 'package:flutter/material.dart';
import 'package:flutter_block_bingo/component/gameblock.dart';

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
