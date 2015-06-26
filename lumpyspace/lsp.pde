// LSP Object

class LSP {
  boolean whatever;
  boolean awesome;
  boolean lumps;
  int x = 700; // x position
  int y = 180; // y position
  int ys = y-68; // star y position
  color body = color(195, 161, 248); // purple
  color star = color(255, 219, 84); // yellow

  void draw() {

    // draw body
    fill(body);
    ellipse(x, y-50, 100, 110); // top
    ellipse(x-43, y-28, 70, 68); // left
    ellipse(x-45, y+20, 85, 78); // lower left
    ellipse(x+40, y-28, 73, 65); // right
    ellipse(x+40, y+19, 82, 85); // lower right
    ellipse(x, y+30, 80, 80); // bottom
    ellipse(x-34, y+64, 35, 30); // bottom left
    ellipse(x+45, y+62, 35, 30); // bottom right
    ellipse(x-12, y+72, 20, 35); // bottom 1
    ellipse(x+5, y+74, 23, 32); // bottom 2
    ellipse(x+25, y+70, 21, 35); // bottom 3

    // draw star
    fill(star);
    pushMatrix();
    translate(x, ys);
    scale(0.32);
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    popMatrix();
    
    // draw the face to match LSP's mood
    if(radioButtons[0].checked == true) {
      drawWhatever();
    }
    if(radioButtons[1].checked == true) {
      drawAwesome();
    }
    if(radioButtons[2].checked == true) {
      drawLumps();
    }
  }
  
  void drawWhatever() {
    // eyes
    fill(0);
    ellipse(x-24, y-25, 11, 10);
    ellipse(x+24, y-27, 11, 10);
    ellipse(x, y-10, 20, 10); // mouth
    // eyebrows
    stroke(0);
    strokeWeight(2.5);
    noFill();
    line(x-30, y-33, x-18, y-30);
    line(x+30, y-33, x+18, y-33);
    strokeWeight(1.5);
    arc(x+16, y-11, 15, 14, 7*PI/12, 3*PI/2); // mouth line
    noStroke();
    
  }
  
  void drawAwesome() {
    // eyes
    fill(0);
    ellipse(x-24, y-28, 18, 18);
    ellipse(x+24, y-28, 18, 18);
    ellipse(x, y-5, 28, 14); // mouth
    fill(255);
    ellipse(x-26, y-31, 11, 11);
    ellipse(x+22, y-31, 11, 11);
    ellipse(x-20, y-23, 5, 5);
    ellipse(x+27, y-23, 5, 5);
    ellipse(x-26, y-24, 2, 2);
    ellipse(x+22, y-24, 2, 2);
  }
  
  void drawLumps() {
    // eyes
    fill(255);
    ellipse(x-24, y-28, 20, 20);
    ellipse(x+24, y-28, 20, 20);
    fill(0);
    ellipse(x-26, y-25, 6, 6);
    ellipse(x+22, y-25, 6, 6);
    ellipse(x-3, y+15, 58, 50); // mouth
    fill(255);
    // top teeth
    arc(x+8, y-7, 8, 10, 0, 7*PI/6, OPEN);
    arc(x-2, y-10, 10, 12, 0, PI, OPEN);
    arc(x-14, y-10, 10, 12, 0, 5*PI/6, OPEN);
    
    // bottom teeth
    arc(x-22, y+38, 12, 15, 4*PI/3, 2*PI, OPEN);
    arc(x-10, y+43, 12, 17, 7*PI/6, 23*PI/12, OPEN);
    arc(x, y+40, 8, 12, PI, 2*PI, OPEN);
    arc(x+8, y+38, 8, 12, 11*PI/12, 23*PI/12, OPEN);
    arc(x+18, y+34, 10, 11, 5*PI/6, 7*PI/4, OPEN);
  }
}

