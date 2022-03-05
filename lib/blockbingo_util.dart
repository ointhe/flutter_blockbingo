import 'dart:math';

import 'package:flutter/widgets.dart';

class BlockBingoUtilSingleTon {
  static final BlockBingoUtilSingleTon _instance =
      BlockBingoUtilSingleTon._internal();

  factory BlockBingoUtilSingleTon() {
    return _instance;
  }

  BlockBingoUtilSingleTon._internal() {}
  var _boxSize = 0.0;
  bool initSize = false;
  get boxSize => _boxSize;

  set boxSize(var boxSize) {
    _boxSize = boxSize;
  }

  void setBoxSizeforContext(BuildContext context) {
    if (!initSize) {
      _boxSize = min(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height) /
          5;
      initSize = !initSize;
    }
  }
}
