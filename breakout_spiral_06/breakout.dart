library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

var paddlex;
var paddleh;
var paddlew;

initPaddle() {
  paddlex = width / 2;
  paddleh = 10;
  paddlew = 75;
}

draw() {
  clear();
  circle(x, y, 10);
  rect(paddlex, height - paddleh, paddlew, paddleh);
  
  if (x + dx > width || x + dx < 0){
    dx = -dx;
  } if (y + dy < 0) {
    dy = -dy;
  } else if (y + dy > height) {
    if (x > paddlex && x < paddlex + paddlew) {
      dy = -dy;
    } else {
      intervalId.cancel();
    }
  }
  
  x += dx;
  y += dy;
}

main() {
  init();
  initPaddle();
}


