// A HONEY object extends FOOD

class Mushroom extends Food {
  float xpos;
  float ypos;
  int value;
  Mushroom(float x, float y) {
    xpos = x;
    ypos = y;
    value = 1;
  }
  
  // draw the mushroom
  void draw() {
    fill(offwhite); // offwhite stem
    rectMode(CENTER);
    rect(xpos, ypos, 12, 8);
    fill(orange); // orange cap
    rect(xpos, ypos-8, 30, 8);
    rect(xpos, ypos-12, 24, 8);
    rect(xpos, ypos-16, 18, 8);
    rect(xpos, ypos-20, 10, 8);
    fill(red); // red spots
    rect(xpos-5, ypos-12, 5, 5);
    rect(xpos-9, ypos-12, 5, 5);
    rect(xpos-9, ypos-14, 5, 5);
    rect(xpos+7, ypos-18, 5, 5);
    rect(xpos+8, ypos-7, 5, 5);
    rect(xpos+8, ypos-9, 5, 5);
    rect(xpos+4, ypos-8, 5, 5);
//    transparent box for testing position
//    fill(255, 255, 255, 80);
//    rect(xpos, ypos-10, 40, 40);
  }
  
  // returns true because this is a mushroom
  boolean isMushroom() {
    return true;
  }
  
  // returns false because this is not honey
  boolean isHoney() {
    return false;
  }
  
  // returns the mushroom's x position
  float getXPosition() {
    return xpos;
  }

  // returns the mushroom's y position
  float getYPosition() {
    return ypos;
  }

  // returns the mushroom's food value
  int getValue() {
    return value;
  }
}
