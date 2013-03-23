part of breakout;

var x = 140;
var y = 150;
var dx = 2;
var dy = 4;
var width;
var height;
var ctx;
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
  intervalId = new Timer.periodic(const Duration(milliseconds: 10), (t) => draw());
  return intervalId;
}


