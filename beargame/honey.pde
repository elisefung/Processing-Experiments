// A HONEY object extends FOOD

class Honey extends Food {
  float xpos;
  float ypos;
  int value;
  Honey(float x, float y) {
    xpos = x;
    ypos = y;
    value = 3;
  }

  void draw() {
    rectMode(CENTER);
    fill(honey);
    rect(xpos, ypos+3, 13, 5);
    rect(xpos, ypos, 15, 5);
    rect(xpos, ypos-3, 13, 5);
    rect(xpos, ypos-6, 9, 5);
    //      transparent box for testing position
//    fill(255, 255, 255, 80);
//    rect(xpos, ypos, 20, 20);
  }

  boolean isMushroom() {
    return false;
  }

  boolean isHoney() {
    return true;
  }

  float getXPosition() {
    return xpos;
  }

  float getYPosition() {
    return ypos;
  }

  int getValue() {
    return value;
  }
}

