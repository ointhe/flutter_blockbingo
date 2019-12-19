import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/src/gestures/tap.dart';

class BoxGame extends Game {
  // The screenSize variable will be initialized having a value of null. 
  // This will be helpful when checking if we know the size of the screen during rendering. More on this later.
  Size screenSize;

  void render(Canvas canvas) {
    // Draw the target box
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150
    );
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);

    //TODO: 
  }

  void update(double t) {
    // TODO: implement update
  }
  // Step 4: Draw the screen
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
  
  void onTapDown(TapDownDetails details) {
    // handle taps here
  }
}