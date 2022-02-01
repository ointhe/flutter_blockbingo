class BlockBingoUtilSingleTon {
  static final BlockBingoUtilSingleTon _instance =
      BlockBingoUtilSingleTon._internal();

  factory BlockBingoUtilSingleTon() {
    return _instance;
  }

  BlockBingoUtilSingleTon._internal() {}
  var _boxSize = 50.0;

  get boxSize => _boxSize;

  set boxSize(var boxSize) {
    _boxSize = boxSize;
  }
}
