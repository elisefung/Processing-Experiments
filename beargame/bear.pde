// a BEAR object

class Bear {
  color bearcolor;
  float xpos;
  float ypos;
  int direction = 1;
  int speed = 8;
  int lives = 3;
  int mushrooms = 0;
  int honey = 0;
  int food = mushrooms + honey;
  boolean home = false;
  Bear (color c, float x, float y) {
    bearcolor = c;
    xpos = x;
    ypos = y;
  }

  void draw() {
    noStroke();
    fill(bearcolor);
    rectMode(CENTER);
    if (direction == 1) {
      rect(xpos, ypos, 60, 40); // body
      rect(xpos-22.5, ypos+20, 15, 20); // left leg
      rect(xpos+22.5, ypos+20, 15, 20); // right leg
      rect(xpos+35, ypos-11, 27, 25); // head
      rect(xpos+25, ypos-22, 10, 10); // ear
      rect(xpos-32, ypos-8, 10, 10); // tail
      //      transparent box for testing position
      //      fill(255, 255, 255, 80);
      //      rect(xpos+35, ypos-10, 25, 25);
    }
    if (direction == -1) {
      rect(xpos, ypos, 60, 40);
      rect(xpos-22.5, ypos+20, 15, 20); // left leg
      rect(xpos+22.5, ypos+20, 15, 20); // right leg
      rect(xpos-35, ypos-11, 25, 25); // head
      rect(xpos-25, ypos-22, 10, 10); // ear
      rect(xpos+32, ypos-8, 10, 10); // tail
      //      transparent box for testing position
      //      fill(255, 255, 255, 80);
      //      rect(xpos-35, ypos-10, 25, 25);
    }
  }

  // move the bear forward
  void moveForward() {
    if (direction == -1) {
      direction *= -1;
    }
    if (xpos >= (width-50)) {
      home = true;
      xpos = xpos;
    } else { 
      xpos += speed;
    }
  }

  // move the bear backward and switch directions
  void moveBackward() {
    if (direction == 1) {
      direction *= -1;
    }
    if (xpos <= 50) {
      xpos = xpos;
    } else { 
      xpos -= speed;
    }
  }

  // move the bear up
  void moveUp() {
    if (ypos <= grassTop-20) {
      ypos = ypos;
    } else { 
      ypos -= speed;
    }
  }

  // move the bear down
  void moveDown() {
    if (ypos >= height-40) {
      ypos = ypos;
    } else { 
      ypos += speed;
    }
  }

  // returns the bear's x position
  float getXPosition() {
    return xpos;
  }

  // returns the bear's y position
  float getYPosition() {
    return ypos;
  }

  // return the numer of lives the bear has left
  int getLives() {
    return lives;
  }

  // return the total numer of food the bear has collected
  int getFood() {
    return food;
  }

  // return the numer of mushrooms the bear has collected
  int getMushrooms() {
    return mushrooms;
  }

  // return the numer of honey the bear has collected
  int getHoney() {
    return honey;
  }

  // determines if a bee overlaps (stings) the bear
  // TO DO: update code so bear is stung if ANY part of bear overlaps bee
  boolean isStung(Bee b) {
    float bx = b.getXPosition();
    float by = b.getYPosition();
    if (direction == 1) { 
      if (xpos+23 >= bx-31 && xpos+48 <= bx+35 && ypos+2 <= by+39 && ypos-22 >= by-47) {
        return true;
      } else { 
        return false;
      }
    } 
    if (direction == -1) { 
      if (xpos-47 >= bx-31 && xpos-22 <= bx+35 && ypos+2 <= by+39 && ypos-22 >= by-47) {
        return true;
      } else { 
        return false;
      }
    } else { 
      return false;
    }
  }

  // remove a life from the bear
  void loseLife() {
    lives = lives - 1;
  }

  // reset the bear's position
  void reset() {
    xpos = bearXStart;
    ypos = bearYStart;
    direction = 1;
  }

  // reset the bear completely
  void restart() {
    lives = 3;
    mushrooms = 0;
    honey = 0;
  }

  // determines if the bear overlaps (gathers) the food
  boolean isOver(Food f) {
    float fx = f.getXPosition();
    float fy = f.getYPosition();
    if (direction == 1) { 
      if (xpos+23 >= fx-20 && xpos+48 <= fx+20 && ypos+2 <= fy+15 && ypos-22 >= fy-35) {
        return true;
      } else { 
        return false;
      }
    } 
    if (direction == -1) {
      if (xpos-47 >= fx-20 && xpos-22 <= fx+15 && ypos+2 <= fy+15 && ypos-22 >= fy-35) {
        return true;
      } else { 
        return false;
      }
    } else { 
      return false;
    }
  }

  // increase the number of food
  void collect(Food f) {
    if (f.isMushroom()) {
      mushrooms += 1;
      updateFood();
    }
    if (f.isHoney()) {
      honey += 1;
      updateFood();
    }
  }

  // returns true if the bear is in his cave
  boolean isHome() {
    return false;
  }

  // update the food count
  void updateFood() {
    food = mushrooms + honey;
  }
}

