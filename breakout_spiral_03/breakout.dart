import 'dart:html';
import 'dart:async';
import 'dart:math';

var x = 150;
var y = 150;
var dx = 2;
var dy = 4;
var ctx;

draw() {
  ctx.clearRect(0,0,300,300);
  ctx.beginPath();
  ctx.arc(x, y, 10, 0, PI*2, true); 
  ctx.closePath();
  ctx.fill();
  x += dx;
  y += dy;
}
 
init() {
  CanvasElement canvas = document.query('#canvas');
  ctx = canvas.getContext('2d');
  new Timer.periodic(const Duration(milliseconds: 10), (t) => draw());
}

main() {
  init();
}


