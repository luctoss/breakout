library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

draw() {
  clear();
  circle(x, y, 10);
  
  if (x + dx > width || x + dx < 0){
    dx = -dx;
  } if (y + dy > height || y + dy < 0){
    dy = -dy;
  }
  
  x += dx;
  y +=dy;
}

main() {
  init();
}


