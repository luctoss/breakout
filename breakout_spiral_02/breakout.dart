import 'dart:html';
import 'dart:math';

void main() {
  CanvasElement canvas = document.query('#canvas');
  CanvasRenderingContext2D ctx = canvas.getContext('2d');
  ctx.fillStyle = "#00A308";
  ctx.beginPath();
  ctx.arc(220, 220, 50, 0, PI*2, true);
  ctx.closePath();
  ctx.fill();
  
  ctx.fillStyle = "#FF1C0A";
  ctx.beginPath();
  ctx.arc(100, 100, 100, 0, PI*2, true);
  ctx.closePath();
  ctx.fill();
  
  ctx.fillStyle = "rgba(255, 255, 0, .5)";
  ctx.beginPath();
  ctx.rect(15, 150, 120, 120);
  ctx.closePath();
  ctx.fill();
}

