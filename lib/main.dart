import 'package:blockbingo/components/test1.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//  async => 동기식 함수에서 비동기식 함수 로 변환 참고 : https://dart.dev/codelabs/async-await
void main() async {  
  // Step 3: Set up the game loop
  // flame 참고 : https://jap.alekhin.io/create-mobile-game-flutter-flame-beginner-tutorial
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;

  runApp(game.widget); 
  flameUtil.addGestureRecognizer(tapper);
  
}