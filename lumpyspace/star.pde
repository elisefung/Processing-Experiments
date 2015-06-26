// Star Object

class Star {
  float x, y, radius;
  color c;
  Star() {
    x = random(20, width-20);
    y = random(20, height-20);
    radius = random(2, 18);
    c = color(248, 252, 121, 200);
  }

  void draw() {
    fill(c);
    ellipse(x, y, radius, radius);
  }
}

