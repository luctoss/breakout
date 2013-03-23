library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

initMouse() {
  CanvasElement canvas = document.query('#canvas');
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + width;
}

onMouseMove(evt) {
  if (evt.pageX > canvasMinX && evt.pageX < canvasMaxX) {
    paddlex = evt.pageX - canvasMinX;
  }
}

draw() {
  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
  clear();
  circle(x, y, 10);
  if (rightDown) {
    paddlex += 5;
  } else if (leftDown) {
    paddlex -= 5;
  }
  rect(paddlex, height - paddleh, paddlew, paddleh);
  if (x + dx > width || x + dx < 0) {
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
  initMouse();
}


