import 'package:flutter/material.dart';

import '../util.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key, this.boxSizeX = 3, this.boxSizeZ = 3})
      : super(key: key);
  final int boxSizeX;
  final int boxSizeZ;
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                for (int colI = 0; colI < widget.boxSizeX; colI++)
                  Row(
                    children: [
                      for (int colI = 0; colI < widget.boxSizeX; colI++)
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                )),
                                // color: Colors.red,
                              ),
                              width: 70,
                              height: 70,
                              // color: Colors.pink,
                            ),
                          ],
                        )
                    ],
                  ),
              ],
            )),
      ),
    );
  }
}
