// a BUTTON object
// different types of buttons are: Difficulty, Replay

class Button {
  int xpos;
  int ypos;
  int w;
  int h;
  int value;
  boolean over = false;
  boolean pressed = false;
  Button(int x, int y, int wi, int he) {
    xpos = x;
    ypos = y;
    w = wi;
    h = he;
    value = 0;
  }
  Button(int x, int y, int wi, int he, int v) {
    xpos = x;
    ypos = y;
    w = wi;
    h = he;
    value = v;
  }

  //  update the status of the button 
  void update() {
    if ((mouseX >= xpos) && (mouseX <= xpos + w) &&
      (mouseY >= ypos) && (mouseY <= ypos + h)) {
      over = true;
    } else {
      over = false;
    }
  }

  //  change the status of the button if pressed
  boolean press() {
    if (over) {
      pressed = true;
      return true;
    } else {
      return false;
    }
  }

    // draw a Difficulty button
  void difficultyBtn() {
    stroke(white);
    strokeWeight(2);
    if (over) {
      fill(hover);
      rect(xpos, ypos, w, h, 20);
    } else {
      fill(bg);
      rect(xpos, ypos, w, h, 20);
    }
    noStroke();
    fill(white);
    if (value == 1) {
      text("safe", xpos+20, ypos+45);
    }
    if (value == 2) {
      text("normal", xpos+20, ypos+45);
    }
    if (value == 3) {
      text("dangerous", xpos+20, ypos+45);
    }
  }

  //  draw a Replay button
  void replayBtn() { 
    stroke(white);
    ellipseMode(CORNER);
    if (pressed) {
      fill(hover);
      ellipse(xpos, ypos, w, h);
      fill(white);
      text("Replay", 460, 250);
      noStroke();
    } else if (over) {
      fill(hover);
      ellipse(xpos, ypos, w, h);
      fill(white);
      text("Replay", 460, 250);
      noStroke();
    } else {
      fill(bg);
      ellipse(xpos, ypos, w, h);
      fill(white);
      text("Replay", 460, 250);
      noStroke();
    }
  }
}

