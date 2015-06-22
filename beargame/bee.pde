// a BEE object

class Bee {
  float xpos;
  float ypos;
  float xorigin;
  float yorigin;
  float speed = 1;
  int xdirection = 1; // left or right
  int ydirection = 1; // top or bottom
  Bee (float x, float y) {
    xpos = x;
    ypos = y;
    xorigin = x;
    yorigin = y;
  }
  
  void draw() {
    rectMode(CENTER);
    fill(white);
    rect(xpos+5, ypos-11, 12, 3); // right wing
    rect(xpos+5, ypos-13, 9, 3);
    rect(xpos, ypos-13, 5, 10); // left wing
    rect(xpos-1, ypos-13, 5, 8);
    fill(yellow);
    rect(xpos, ypos, 25, 15); // body
    rect(xpos+1, ypos-4.5, 18, 10); // top
    rect(xpos+1, ypos+4.5, 13, 10); // bottom
    fill(black);
    rect(xpos+1, ypos, 4, 19); // left stripe
    rect(xpos-6, ypos, 4, 17); // middle stripe
    rect(xpos+8, ypos, 4, 17); // right stripe
    rect(xpos+15, ypos-3, 5, 3); // tail
//  transparent box for testing position
//    fill(255, 255, 255, 80);
//    rect(xpos+2, ypos-4, 66, 76);
  }
  
  void move() {
    ypos = ypos + (speed * ydirection);
    if(ypos > yorigin+5 || ypos < yorigin-5) {
      ydirection *= -1;
    }
  }
  
  float getXPosition() {
    return xpos;
  }
  
  float getYPosition() {
    return ypos;
  }
}
