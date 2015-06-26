// RadioButton Object

class RadioButton {
  int x, y; 
  int size, dotSize; 
  float borderWeight;
  color  baseColor, borderColor, dotColor;
  boolean checked = false;
  int myID;
  RadioButton[] others;

  // Constructor
  // parameters:  x, y, size, baseColor, borderColor, dotColor, borderWeight,  checked, radioButtonArray
  // only ONE radio button per group should be checked when starting out
  RadioButton(int xp, int yp, int id, RadioButton[] o) {
    x = xp;
    y = yp;
    size = 15;
    dotSize = size - size / 3 - 1; // we want the dot somewhat smaller than the button itself
    baseColor = btnColor;
    borderColor = outlineColor;
    dotColor = color(255, 219, 84);
    borderWeight = 1.5;
    myID = id;
    others = o; // the other radio buttons in our set
  }

  // Updates the boolean value press, returns true or false
  boolean press() {
    if (dist(x, y, mouseX, mouseY) < size / 2) {
      checked = true;
      for (int i = 0; i < others.length; i++) {
        if (i != myID) {
          others[i].checked = false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  // Draws the element to the display window
  void display() {
    stroke(borderColor);
    strokeWeight(borderWeight);
    fill(baseColor);
    ellipse(x, y, size, size);
    if (checked) {
      noStroke();
      fill(dotColor);
      ellipse(x, y, dotSize, dotSize);
    }
    noStroke();
  }

  // status 
  // returns whether we are checked or not
  boolean status() {
    return checked;
  }
}

