part of breakout;

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;
var ctx;
var width;
var height;
var paddlex;
var paddleh = 10;
var paddlew = 75;
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
 
init() {
  CanvasElement canvas = document.query('#canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width;
  height = canvas.height;
  paddlex = width / 2;
  intervalId = new Timer.periodic(const Duration(milliseconds: 10), (t) => draw());
  return intervalId;
}


