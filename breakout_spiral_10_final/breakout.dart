library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

var ballr = 10;
var rowcolors = ["#FF1C0A", "#FFFD0A", "#00A308", "#0008DB", "#EB0093"];
var paddlecolor = "#FFFFFF";
var ballcolor = "#FFFFFF";
var backcolor = "#000000";

draw() {
  document.onKeyDown.listen(onKeyDown);
  document.onKeyUp.listen(onKeyUp);
  document.onMouseMove.listen(onMouseMove);
  ctx.fillStyle = backcolor;
  clear();
  ctx.fillStyle = ballcolor;
  circle(x, y, ballr);
  if (rightDown) {
    paddlex += 5;
  } else if (leftDown) {
    paddlex -= 5;
  }
  ctx.fillStyle = paddlecolor;
  rect(paddlex, height - paddleh, paddlew, paddleh);
  drawBricks();
  var rowheight = brickheight + padding;
  var colwidth = brickwidth + padding;
  var row = (y/rowheight).floor();
  var col = (x/colwidth).floor();
  if (y < nrows * rowheight && row >= 0 && col >= 0 && bricks[row][col] == 1) {
    dy = -dy;
    bricks[row][col] = 0;
  }
  if (x + dx + ballr > width || x + dx - ballr < 0) {
    dx = -dx;
  } if (y + dy - ballr < 0) {
    dy = -dy;
  } else if (y + dy + ballr > height - paddleh) {
    if (x > paddlex && x < paddlex + paddlew) {
      dx = 8 * ((x - (paddlex + paddlew / 2)) / paddlew);
      dy = -dy;
    } else if (y + dy + ballr > height) {
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


