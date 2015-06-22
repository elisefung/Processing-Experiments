/* ---------------------------------------------
 FISH BOWL SCENE
 Click inside the bowl to feed the fish
 -------------------------------------------- */

ArrayList<Food> dinner; // arraylist of food
Fish myFish = new Fish(300, 400); // create our fish

float fishbowlTop = 130;
float fishbowlBottom = 480;
float fishbowlLeft = 250;
float fishbowlRight = 550;

void setup() {
  size(800, 600);
  dinner = new ArrayList<Food>(); // create an arraylist of food
}

void draw() {
  background(250);
  noStroke();
  smooth();

  // table
  fill(235, 195, 121);
  rect(0, 500, 800, 100);

  // fishbowl
  fill(237, 250, 250);
  ellipse(400, 320, 450, 430); // bowl
  fill(233, 248, 248);
  ellipse(400, 145, 320, 90); // rim

  // water
  fill(147, 218, 219);
  arc(400, 320, 450, 430, 0, PI, OPEN);

  // move and display food
  for (int i = 0; i < dinner.size (); i++) {
    Food food = dinner.get(i);
    if (food.y >= fishbowlBottom) {
      dinner.remove(food);
    } else if (myFish.isEating(food)) {
      println("Yum! The fish ate the food!");
      dinner.remove(food);
      myFish.grow();
    } else {
      food.move();
      food.display();
    }
  }

  // move and display fish
  myFish.move();
  myFish.display();
}

// mouseClicked(): add a new food when the user clicks inside the bowl
void mouseClicked() {
  if ( mouseX > fishbowlLeft && mouseX < fishbowlRight && mouseY > fishbowlTop && mouseY < fishbowlBottom) {
    dinner.add(new Food(mouseX, mouseY));
  }
}

