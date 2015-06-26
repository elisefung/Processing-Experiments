/* ---------------------------------------------
 LUMPY SPACE PRINCESS CONTROLLER
 Change LSP's mood, send her a text, 
 or add stars to Lumpy Space.
 -------------------------------------------- */

final color bgColor = color(58, 16, 52);
final color textColor = color(255);
final color btnColor = color(255, 220);
final color hoverColor = color(255, 219, 84);
final color clickColor = color(255, 219, 84);
final color outlineColor = color(112, 72, 106);
PFont fontHeader, fontLabel, fontText;
String greeting = "Welcome to Lumpy Space!"; // initial greeting
String custom = "";

// UI element declarations
Slider starSlider;
Button sendButton;
RadioButton[] radioButtons = new RadioButton[3];
ArrayList<Star> stars;
LSP lsp;

void setup() {
  size(900, 470);
  smooth();
  noStroke();
  fontHeader = loadFont("fontHeader.vlw");
  fontLabel = loadFont("fontLabel.vlw");
  fontText = loadFont("fontText.vlw");

  // create UI elements
  sendButton = new Button(500, 435);
  starSlider = new Slider (630, 440, 250, 14, 0, 150.0);
  radioButtons[0] = new RadioButton(40, 397, 0, radioButtons);
  radioButtons[1] = new RadioButton(40, 422, 1, radioButtons);
  radioButtons[2] = new RadioButton(40, 447, 2, radioButtons);
  // first radio button starts out checked
  RadioButton active = radioButtons[0];
  active.checked = true;

  lsp = new LSP();
  stars = new ArrayList<Star>();
  // create default number of stars
  for (int i = 0; i <= 10; i++) {
    stars.add(new Star());
  }
}

// draw the scene
void draw() {
  background(bgColor);

  // draw stars
  starsUpdate();
  for (int i = 0; i < stars.size ()-1; i++) {
    Star s = stars.get(i);
    s.draw();
  }

  // draw clouds
  fill(98, 116, 192); // purple
  ellipse(140, 520, 300, 300);
  ellipse(210, 480, 210, 300);
  fill(25, 184, 205); // blue
  ellipse(190, 540, 290, 300);
  ellipse(250, 500, 300, 300);
  ellipse(350, 500, 350, 400);
  ellipse(550, 520, 400, 350);
  ellipse(650, 590, 500, 400);
  ellipse(800, 580, 500, 300);

  // draw text
  fill(textColor);
  textFont(fontLabel, 26);
  text("How is LSP feeling today", 30, 375);
  text("Make some stars", 630, 430);
  text("Text LSP (just start typing)", 260, 375);
  textFont(fontLabel, 24);
  text("whatever", 60, 405);
  text("awesome", 60, 430);
  text("what the lumps", 60, 455);
  
  // draw LSP
  lsp.draw();

  // make LSP talk
  fill(textColor);
  textFont(fontHeader, 70);
  text(greeting, 120, 100);
  
  // draw text message box
  fill(255, 200);
  stroke(outlineColor);
  strokeWeight(1.5);
  rect(260, 385, 300, 45, 5, 5, 5, 5);
  noStroke();

  // display text message
  strokeWeight(1);
  fill(bgColor);
  textFont(fontText, 14);
  text(custom, 270, 402);

  // draw UI elements
  starSlider.update();
  starSlider.display();
  sendButton.display();
  sendButton.update();
  radioButtons[0].display();
  radioButtons[1].display();
  radioButtons[2].display();

}

void mousePressed() {
  print ("Mouse clicked: ");
  starSlider.press();
  if (sendButton.press()) {
    println ("Sent message");
    custom = "";
    greeting = "          ew, who's texting me";
  }
  // radio button processing
  if (radioButtons[0].press()) { 
    println ("LSP is whatever");
    greeting = "                  Yeah, whatever.";
  }
  if (radioButtons[1].press()) { 
    println ("LSP is awesome");
    greeting = "                  Oh My Glob!\n                               No Way!";
  }
  if (radioButtons[2].press()) { 
    println ("LSP is what the lumps");
    greeting = "\n            Whatever, it's 2009!";
  }
}

void mouseReleased() {
  sendButton.release();
  starSlider.release();
  println("There are " + stars.size() + " stars");
}

// adds a line break to the string
int count = 0;
void keyPressed() {
  if(count >= 45) {
    custom = custom + "\n" + key;
    count = 0;
  }
  else {
    custom = custom + key;
    count += 1;
  }
}

// update the array of stars to match the slider amount
void starsUpdate() {
  float sliderNum = starSlider.getPos();
  int numStars = int(sliderNum);
  // add stars
  if (stars.size() <= numStars) {
    int diff = numStars - stars.size();
    for (int i = 0; i <= diff; i++) {
      stars.add(new Star());
    }
  }
  // remove stars
  if (stars.size() > numStars) {
    int extra = stars.size() - numStars - 1;
    for (int i = 0; i < extra; i++) {
      stars.remove(i);
    }
  }
}

