/* ----------------------------------------------------------------
 BEAR EXPLORER GAME
 
 Directions:
 Guide the bear through the forest so he can rest for 
 the winter. Collect food (honey and mushrooms) along the way,
 but watch out for bees (they sting!)
 --------------------------------------------------------------- */
import ddf.minim.*;
Minim minim;
AudioPlayer gather;
AudioPlayer start;
AudioPlayer over;

// global variables

boolean setup = true;
boolean setup2 = true;
PFont label;
Button difficulty1, difficulty2, difficulty3, replay;
Bear brownbear;

color bg = color(209, 195, 156);
color hover = color(198, 180, 132);
color brown = color(128, 64, 21); // brown bear
color blackb = color(43, 36, 23); // black bear
color black = color(0, 0, 0); 
color white = color(255, 255, 255);
color offwhite = color(254, 242, 211); // mushroom stem
color orange = color(241, 170, 81); // mushroom cap
color red = color(238, 86, 49); // mushroom spots
color yellow = color(255, 245, 53); // bee yellow
color honey = color(237, 167, 51); // honey yellow
color grass = color(55, 118, 4); // forest grass
color pine = color(55, 118, 4); // pine green
color dirt = color(68, 56, 37); // forest path
color sky = color(124, 178, 211); // forest sky

int width = 1100;
int height = 300;
int pathTop = height - height/3;
int grassTop = height/2;
int treeTop = height/3;
int skyTop = height/3;
int maxShrooms = 3;
int maxHoney = 2;
int maxBees = 2;
float bearXStart = 90;
float bearYStart = pathTop-15;

// Game World Instances
Forest forest;
ArrayList<Food> food; 
ArrayList<Tree> trees;
ArrayList<Bee> bees;  
Bear bear; 

void setup() {
  smooth();
  minim = new Minim(this);
  gather = minim.loadFile("gather.wav");
  start = minim.loadFile("start.wav");
  over = minim.loadFile("over.wav");
  difficulty1 = new Button(290, 170, 105, 70, 1);
  difficulty2 = new Button(460, 170, 135, 70, 2);
  difficulty3 = new Button(660, 170, 185, 70, 3);
  brownbear = new Bear(brown, 300, 200);
  replay = new Button(441, 206, 130, 60);
  bear = new Bear(brown, bearXStart, bearYStart);
  forest = new Forest(bear);
  forest.createTrees();
  size(width, height);
  background(bg);
  noStroke(); 
  frameRate(15);
  label = loadFont("label.vlw");
}

void draw() {
  if (setup) {
    setupDifficulty();
  } else {
    if (forest.gameOver()) {
      over.play();
      endGame();
    } else { 
      forest.draw();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      bear.moveUp();
    }
    if (keyCode == DOWN) {
      bear.moveDown();
    } 
    if (keyCode == LEFT) {
      bear.moveBackward();
    }
    if (keyCode == RIGHT) {
      bear.moveForward();
    }
  }
}

void mousePressed() {
  if (difficulty1.press()) {
    maxBees = 2;
    forest.createBees();
    maxShrooms = 3;
    forest.createFood();
    setup = false;
  }
  if (difficulty2.press()) {
    maxBees = 6;
    forest.createBees();
    maxShrooms = 5;
    forest.createFood();
    setup = false;
  }
  if (difficulty3.press()) {
    maxBees = 24;
    forest.createBees();
    maxShrooms = 9;
    forest.createFood();
    setup = false;
  }
  if (replay.press()) {
    println("Replaying game");
    forest.restart();
    start.play();
  }
}

void setupDifficulty() {
  fill(white);
  textFont(label, 40);
  text("Choose a forest difficulty", 350, 100);
  difficulty1.difficultyBtn();
  difficulty1.update();
  difficulty2.difficultyBtn();
  difficulty2.update();
  difficulty3.difficultyBtn();
  difficulty3.update();
}

void drawScore() {
  fill(white);
  textFont(label, 20);
  text("COLLECT FOOD BUT AVOID THE BEES!", 15, 30);
  text("LIVES: " + bear.getLives(), 1015, 30);
  text("FOOD: " + bear.getFood(), 900, 30);
}

void endGame() {
  rectMode(CORNER);
  fill(bg);
  rect(0, 0, width, height);
  fill(white);
  textFont(label, 40);
  text("GAME OVER", 400, 100);
  text("You collected " + bear.getFood() + " food", 350, 150);
  replay.update();
  replay.replayBtn();
}

