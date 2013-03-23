part of breakout;

var x = 130;
var y = 150;
var dx = 2;
var dy = 4;
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
 
init() {
  CanvasElement canvas = document.query('#canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width;
  height = canvas.height;
  paddlex = width / 2;
  canvasMinX = canvas.offset.left;
  canvasMaxX = canvasMinX + width;
  intervalId = new Timer.periodic(const Duration(milliseconds: 10), (t) => draw());
  return intervalId;
}


