// Slider Object

class Slider {

  int x, y; // The x- and y-coordinates
  float sw, sh; // Width and height of scrollbar
  float pos; // Position of thumb
  float posMin, posMax; // Max and min values of thumb INTERNAL
  boolean rollover; // True when the mouse is over
  boolean locked; // True when its the active scrollbar
  float minVal, maxVal; // Min and max values for the thumb EXTERNAL UNITS
  color baseColor;
  color borderColor;
  color overColor;
  color pressColor;
  float borderWeight;

  // Slider constructor
  // parameters:  x, y, width, height, minValue, maxValue, baseColor, borderColor, overColor, pressColor, borderWeight
  Slider(int xp, int yp, int w, int h, float miv, float mav) {
    x = xp;
    y = yp;
    sw = w;
    sh = h;
    minVal = miv;
    maxVal = mav;
    pos = x+26; // we start at 0 position, you can do a set to change it after creation
    posMin = x;
    posMax = x + sw - sh;
    baseColor = btnColor;
    borderColor = outlineColor;
    overColor = hoverColor;
    pressColor = clickColor; 
    borderWeight = 1.5;
  }

  // update()
  // Updates the over boolean and the position of the thumb, called from draw() in main
  void update() {
    if (over()) {
      rollover = true;
    }  else {
      rollover = false;
    }
    if (locked == true) {
      pos = constrain(mouseX - sh / 2, posMin, posMax);
    }
  }

  // press() 
  // Locks the thumb so the mouse can move off and still update, called from mousePressed() in main
  void press() {
    if (rollover) {
      locked = true;
    }  else {
      locked = false;
    }
  }

  // release()
  // Resets the scrollbar to neutral, called from mouseReleased event in main program
  void release() {
    locked = false;
  }

  // over() 
  // Returns true if the cursor is over the scrollbar
  boolean over() {
    if ((mouseX > x) && (mouseX < x + sw) && (mouseY > y) && (mouseY < y + sh)) {
      return true;
    } else {
      return false;
    }
  }

  // display
  // Draws the scrollbar to the screen, called from draw() in main
  void display() {
    strokeWeight(borderWeight);
    stroke(borderColor);
    fill(baseColor);
    rect(x, y, sw, sh);
    if (rollover || locked) {
      fill(pressColor);
    } else {
      fill(overColor);
    }
    fill(255, 219, 84);
    rect(pos, y, sh, sh); // thumb
  }

 // setPos
 // Sets the current value of the thumb pos is in the callers units
  void setPos(float pv) {
    pos = map (pv, minVal, maxVal, posMin, posMax);
  }

  // getPos
  // Returns the current value of the thumb pos is in the callers units
  float getPos() {
    float scalar = sw / (sw - sh);
    float ratio = (pos - x) * scalar;
    float offset = minVal + (ratio / sw * (maxVal - minVal));
    return offset;
  }
}
