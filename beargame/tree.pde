// a TREE object

class Tree {
  float xpos;
  float ypos;
  Tree(float x, float y) {
    xpos = x;
    ypos = y;
  }
  
  void draw() {
    rectMode(CENTER);
    fill(dirt);
    rect(xpos, ypos, 15, 18);
    fill(pine);
    rect(xpos, ypos-10, 50, 15);
    rect(xpos, ypos-20, 42, 15);
    rect(xpos, ypos-30, 34, 15);
    rect(xpos, ypos-40, 26, 15);
    rect(xpos, ypos-48, 18, 15);
    rect(xpos, ypos-54, 10, 15);
  }
}
