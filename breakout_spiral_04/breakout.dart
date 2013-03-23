library breakout;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'functions.dart';

draw() {
  clear();
  circle(x, y, 10);
  
  x += dx;
  y +=dy;
}

main() {
  init();
}


