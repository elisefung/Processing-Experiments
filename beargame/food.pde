// an abstract FOOD object

abstract class Food {
  float xpos;
  float ypos;
  int value;

  abstract void draw();
  
  void disappear() {
  }
  
  abstract boolean isMushroom();

  abstract boolean isHoney();

  abstract float getXPosition();
  
  abstract float getYPosition();
  
  abstract int getValue();
}

