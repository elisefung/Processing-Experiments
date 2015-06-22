// Food Object

class Food {
  
  int w; // width of food
  int h; // height of food
  float x; // X coord position
  float y; // Y coord position
  color c; // color of food
 
  Food(float pX, float pY) {
    w = 5;
    h = 10;
    x = pX;
    y = pY;
    c = color(161, 127, 100); // brown
  }
  
  // move: update the food position as it falls vertically only
  void move() {
    y += 1; 
  }
  
  // display: draw the food
  void display() {
    noStroke();
    fill(c);
    rect(x, y, w, h, 3);
  }  
}
