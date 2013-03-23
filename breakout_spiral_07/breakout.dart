library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

bool rightDown = false;
bool leftDown = false;

onKeyDown(evt) {
  if (evt.keyCode == 39) {
    rightDown = true;
  } else if (evt.keyCode == 37) {
    leftDown = true;
  }
}

onKeyUp(evt) {
  if (evt.keyCode == 39) {
    rightDown = false;
  } else if (evt.keyCode == 37) {
    leftDown = false;
  }
}

draw() {
  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  clear();
  circle(x, y, 10);
  if (rightDown) {
    paddlex += 5;
  } else if (leftDown) {
    paddlex -= 5;
  }
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
}


