// the forest world

class Forest {
  Bear bear;
  ArrayList<Food> food;
  ArrayList<Bee> bees;
  ArrayList<Tree> trees;
  Forest (Bear b) {
    bear = b;
    food = new ArrayList<Food>();
    bees = new ArrayList<Bee>();
    trees = new ArrayList<Tree>();
  }

  // create food objects and add them to an array of food
  void createFood() {
    for (int i = 0; i <= maxShrooms-1; i++) {
      food.add(new Mushroom(random(200, 1000), random(pathTop, height-50)));
    }
    for (int i = 0; i <= maxHoney-1; i++) {
      food.add(new Honey(random(200, 1000), random(treeTop, treeTop+60)));
    }
  }

  // create bee objects and add them to an array of bees
  void createBees() {
    for (int i = 0; i <= maxBees-1; i++) {
      bees.add(new Bee(random(200, 1000), random(skyTop-20, pathTop+20)));
    }
  }

  // create tree objects and add them to an array of trees
  void createTrees() {
    for (int i = 10; i <= 1200; i+=60) {
      trees.add(new Tree(i, grassTop-5));
    }
  }

  // draw the forest
  void draw() {
    drawBackground();
    drawTrees();
    drawFood();
    bear.draw();
    gather();
    drawBees();
    sting();
    drawScore();
  }

  // draw the scene
  void drawBackground() {
    rectMode(CORNER);
    fill(sky); // blue sky
    rect(0, 0, width, height);
    // draw clouds
    fill(grass); // green grass
    rect(0, grassTop, width, height);
    fill(dirt); // brown ground
    rect(0, pathTop, width, height);
  }

  // draw the food
  void drawFood() {
    for (int i = 0; i <= food.size ()-1; i++) {
      Food f = food.get(i);
      f.draw();
    }
  }

  // draw the bees
  void drawBees() {
    for (int i = 0; i <= bees.size ()-1; i++) {
      Bee b = bees.get(i);
      b.draw();
      b.move();
    }
  }

  // draw the trees
  void drawTrees() {
    for (int i = 0; i <= trees.size ()-1; i++) {
      Tree t = trees.get(i);
      t.draw();
    }
  }

  // determine if bear is over (gathering) any of the food, remove (collect) the food, add another food 
  void gather() {
    for (int i = 0; i <= food.size ()-1; i++) {
      Food f = food.get(i);
      boolean shroom = f.isMushroom();
      if (bear.isOver(f)) {
        bear.collect(f);
        food.remove(f);
        gather.play();
        println("food: " + bear.getFood() + ", mushrooms: " + bear.getMushrooms() + ", honey: " + bear.getHoney());
        // max food is 10 so the bear doesn't get fat
        if (food.size() <= 2 && bear.getFood() <= 10) {
          if (shroom) {
            food.add(new Mushroom(random(200, 1000), random(pathTop, pathTop+60)));
          } else { 
            food.add(new Honey(random(200, 1000), random(treeTop, treeTop+40)));
          }
        }
      }
    }
  }

  // determine if bee is over (stings) the bear, remove a life, start bear over at beginning
  void sting() {
    for (int i = 0; i <= bees.size ()-1; i++) {
      Bee b = bees.get(i);
      if (bear.isStung(b)) {
        bear.loseLife();
        start.play();
        println("ouch, bear was stung");
        reset();
      }
    }
  }

  // reset the world when the bear is stung, recreate food, bees, and bear
  void reset() {
    bear.reset();
    food.clear();
    bees.clear();
    createFood();
    createBees();
  }
  
  // restart the entire world
  void restart() {
    bear.restart();
    food.clear();
    bees.clear();
    createFood();
    createBees();
  }

  // returns true if the bear has 0 lives
  boolean gameOver() {
    if (bear.getLives() == 0) {
      return true;
    } else { 
      return false;
    }
  }
}

