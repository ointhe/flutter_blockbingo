// import 'package:flutter/material.dart';
// import 'package:flutter_block_bingo/component/gameblock.dart';
// import 'package:flutter_block_bingo/component/gameboard.dart';

// class GameBoardProvider with ChangeNotifier {
//   bool addGameBlock(GameBoard gameBoard, GameBlock gameBlock) {
//     //add fail
//     if (gameBoard.blockOpacity.length < gameBlock.blockType.length)
//       return false;
//     int boardIdx = 0;
//     for (var element in gameBlock.blockType) {
//       gameBoard.blockOpacity[boardIdx] =
//           gameBoard.blockOpacity[boardIdx] > (1.0 - 0.33)
//               ? 0
//               : gameBoard.blockOpacity[boardIdx] + (element ? 0.33 : 0.0);
//       boardIdx++;
//     }
//     notifyListeners();
//     return true;
//   }
// }
