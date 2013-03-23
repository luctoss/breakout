library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

var bricks;
var nrows;
var ncols;
var brickwidth;
var brickheight;
var padding;

initBricks() {
  nrows = 5;
  ncols = 5;
  brickwidth = (width / ncols) - 1;
  brickheight = 15;
  padding = 1;
  bricks = new List(nrows);
  for (int i = 0; i < nrows; i++) {
    bricks[i] = new List(ncols);
    for (int j = 0; j < ncols; j++) {
      bricks[i][j] = 1;
    }
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
  for(int i = 0; i < nrows; i++) {
    for (int j = 0; j < ncols; j++) {
      if (bricks[i][j] == 1) {
        rect((j * (brickwidth + padding)) + padding, (i * (brickheight + padding)) + padding, brickwidth, brickheight);
      }
    }
  }
  var rowheight = brickheight + padding;
  var colwidth = brickwidth + padding;
  var row = (y/rowheight).floor();
  var col = (x/colwidth).floor();
  if (y < nrows * rowheight && row >= 0 && col >= 0 && bricks[row][col] == 1) {
    dy = -dy;
    bricks[row][col] = 0;
  }
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
  initBricks();
}


