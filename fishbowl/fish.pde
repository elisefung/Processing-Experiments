// Fish Object

class Fish {
  float w; // width of fish
  float h; // height of fish
  float size;
  float x; // X coord position
  float y; // Y coord position
  color c; // color of fish
  float speed; // speed the fish moves at

  Fish(float pX, float pY) {
    w = 70;
    h = 40;
    x = pX;
    y = pY;
    c = color(252, 161, 86); // orange
    speed = 1;
  }

  // display: draw the fish
  void display() {
    noStroke();
    if (speed == 1) {
      fill(c);
      ellipse(x, y, w+size, h+size); // body
      triangle(x-5, y-15, x+20, y-15, x-8, y-35); // top fin
      triangle(x-5, y+15, x+15, y+15, x-8, y+30); // bottom fin
      triangle(x-20, y, x-50, y-15, x-45, y); // top tail
      triangle(x-20, y, x-50, y+15, x-45, y); // bottom tail
      fill(255);
      ellipse(x+15, y-5, 8, 8); // eye
      fill(0);
      ellipse(x+16, y-4, 3, 3); // pupil
    } else if (speed == -1) {
      fill(c);
      ellipse(x, y, w+size, h+size); // body
      triangle(x+5, y-15, x-20, y-15, x+8, y-35); // top fin
      triangle(x+5, y+15, x-15, y+15, x+8, y+30); // bottom fin
      triangle(x+20, y, x+50, y-15, x+45, y); // top tail
      triangle(x+20, y, x+50, y+15, x+45, y); // bottom tail
      fill(255);
      ellipse(x-15, y-5, 8, 8); // eye
      fill(0);
      ellipse(x-16, y-4, 3, 3); // pupil
    }
  }

  // move: move the fish back and forth in the bowl
  void move() {
    x = x + speed;
    // Check the horizontal edges
    if (x > fishbowlRight  || x < fishbowlLeft) {
      speed *= -1;
    }
  }

  // isEating: returns true if the fish's mouth position is over the food
  boolean isEating(Food f) {
    boolean eat;
    if (speed == 1) {
      if ( f.x > x+10 && f.x < x+30 && f.y > y-10 && f.y < y+30) {
        eat = true;
      } else {
        eat = false;
      }
    } else if (speed == -1) {
      if ( f.x > x-30 && f.x < x-10 && f.y > y-10 && f.y < y+30) {
        eat = true;
      } else {
        eat = false;
      }
    } else {
      eat = false;
    }
    return eat;
  }

  void grow() {
    size += 3;
  }
}

