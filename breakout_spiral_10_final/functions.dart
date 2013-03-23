part of breakout;

var x = 25;
var y = 250;
var dx = 1.5;
var dy = -4;
var ctx;
var width;
var height;
var paddlex;
var paddleh = 10;
var paddlew = 75;
bool rightDown = false;
bool leftDown = false;
var canvasMinX = 0;
var canvasMaxX = 0;
var intervalId = 0;
var bricks;
var nrows = 5;
var ncols = 5;
var brickwidth;
var brickheight = 15;
var padding = 1;

init() {
  CanvasElement canvas = document.query('#canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width;
  height = canvas.height;
  paddlex = width / 2;
  brickwidth = (width / ncols) - 1;
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + width;
  intervalId = new Timer.periodic(const Duration(milliseconds: 10), (t) => draw());
  return intervalId;
}

circle(x, y, r) {
  ctx.beginPath();
  ctx.arc(x, y, r, 0, PI*2, true);
  ctx.closePath();
  ctx.fill();
}

rect(x, y, w, h){
  ctx.beginPath();
  ctx.rect(x, y, w, h);
  ctx.closePath();
  ctx.fill();
}

clear() {
  ctx.clearRect(0, 0, width, height);
  rect(0, 0, width, height);
}

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
 
onMouseMove(evt) {
  if (evt.pageX > canvasMinX && evt.pageX < canvasMaxX) {
    paddlex = max(evt.pageX - canvasMinX - (paddlew / 2), 0);
    paddlex = min(width - paddlew, paddlex);    
  }
}

initBricks() {
  bricks = new List(nrows);
  for (int i = 0; i < nrows; i++) {
    bricks[i] = new List(ncols);
    for (int j = 0; j < ncols; j++) {
      bricks[i][j] = 1;
    }
  }
}

drawBricks() {
  for(int i = 0; i < nrows; i++) {
    ctx.fillStyle = rowcolors[i];
    for (int j = 0; j < ncols; j++) {
      if (bricks[i][j] == 1) {
        rect((j * (brickwidth + padding)) + padding, (i * (brickheight + padding)) + padding, brickwidth, brickheight);
      }
    }
  }
}
