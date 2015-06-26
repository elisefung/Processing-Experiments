// Button Object

class Button {
  int x, y, w, h;
  color borderColor;
  float borderWeight;
  color baseColor; 
  color overColor; 
  color pressColor; 
  boolean over = false; 
  boolean pressed = false; 

  // constructor
  // parameters:  x, y, size, baseColor, borderColor, overColor, pressColor, borderWeight
  Button(int xp, int yp) {
    x = xp;
    y = yp;
    w = 60;
    h = 25;
    baseColor = btnColor;
    overColor = hoverColor;
    pressColor = clickColor;
    borderColor = outlineColor;
    borderWeight = 1.5;

  }

  //  update 
  //  called from draw in main program
  void update() {
    if ((mouseX >= x) && (mouseX <= x + w) &&
      (mouseY >= y) && (mouseY <= y + h)) {
      over = true;
    } else {
      over = false;
    }
  }

  //  press
  //  called by the main program in the mousePressed handler to see if button has been pressed
  boolean press() {
    if (over) {
      pressed = true;
      return true;
    } else {
      return false;
    }
  }

  // release
  // called by main program in the mouseReleased handler to update the pressed status
  void release() {
    pressed = false; 
  }

  //  display
  //  called by the main program in the draw handler to update the look of the button
  void display() {
    if (pressed) {
      fill(pressColor);
    }  else if (over) {
      fill(overColor);
    }  else {
      fill(baseColor);
    }
    stroke(borderColor);
    strokeWeight(borderWeight);
    rect(x, y, w, h, 20, 20, 20, 20);
    fill(borderColor);
    textFont(fontLabel, 20);
    text("SEND", x+19, y+20);
  }
}

