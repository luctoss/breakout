import 'dart:html';
import 'dart:math';

void main() {
  CanvasElement canvas = document.query('#canvas');
  CanvasRenderingContext2D ctx = canvas.getContext('2d');
  ctx.arc(75, 75, 10, 0, PI*2, true);
  ctx.stroke();
}

