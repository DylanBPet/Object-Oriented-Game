boolean gameIsOver = true;    //is the game over(true) or not(false)

boolean screenIsBlack = false; //is the screen black or not
boolean holdSpace = false;  //this is for if the player holds space, it does not flash between white and black background

boolean holdA = false;     //is the player holding the A key it makes it less stuttery when moving left to right
float xMove = 22; //position of Player on x axis, will need this for hit detection
boolean holdD = false;      //is the player holding the D key it makes it less stuttery when moving left to right

ArrayList<Ball> balls; //the arraylist of balls falling

Player player; //the player class, used to display, move, and signify they have been hit

int score; //what will display on the scoreboard

PImage healthy; //the image of the full red heart
PImage hurt; //the image of the empty red heard
int health = 3; //starting health

void setup() {
  size (400, 400);

  //initialize arraylist
  balls = new ArrayList<Ball>();
  balls.add(new Ball(random(0, 400), -17)); //add the first ball to start the sequence

  //initialize PImages
  healthy = loadImage("game-heart-pixelated-free-png.png");
  hurt = loadImage("pixel-heart-icon-md.png");
}


void draw() {
  ///////////////////Game OverScreen//////////////////////
  if (gameIsOver == true) {
    displayGameOver();
  } else {
    
    player = new Player(); //initalize player Class

    if (screenIsBlack == true) { //changes screen to black or white depending on the screenisblack boolean, which is changed in keypressed with space
      background(0); //black
    } else {
      background(255); //white
    }

    //////Bottom Bar////////////////
    if (screenIsBlack == true) { //changes the bottom bar color based on the screenisblack boolean
      fill(255); //white
    } else if (screenIsBlack == false) {
      fill(0); //black
    }

    rect(0, 335, 400, 400);

    if (screenIsBlack == true) { //changes the text color based on the screenisblack boolean
      fill(0); //black
    } else if (screenIsBlack == false) {
      fill(255); //white
    }

    /////////////////instructions and scoreboard /////////////////////
    textSize(25);
     score = balls.size(); //sets the score to length of arraylist
    text("Press Space            " + score, 135, 370);


    ////////////////Health///////////////
    //making them the correct size
    hurt.resize(40, 40);
    healthy.resize(40, 40);

    ////health 1 (left)
    if (health >= 1) {
      image (healthy, 0, 350);
    } else if (health <= 0) {
      image(hurt, 0, 350);
      gameIsOver = true;
    }

    //health 2 (middle)
    if (health >= 2) {
      image (healthy, 40, 350);
    } else if (health <= 1) {
      image(hurt, 40, 350);
    }

    //health 3 (right)
    if (health == 3) {
      image (healthy, 80, 350);
    } else if (health <= 2) {
      image(hurt, 80, 350);
    }

    //////////////////////////////Ball/////////////////////////////////
    for (int i = balls.size()-1; i >=0; i--) {
      Ball ball = balls.get(i);
      ball.display(); //display the balls
      ball.fall(); //move the ball
      ball.bounce(); //cause the ball to bounce off the bottom bar, and triggers spawnnewball
      if (ball.spawnNewBall()) { //when true, add a new ball on arraylist
        balls.add(new Ball(random(0, 400), -17)); //always spawn it with a random x and a y above screen
      }
          ////////////////////////////Player///////////////////////////////////////
      if (ball.hitDetection(xMove)) {//hit detection for the player
        health --; //subtrack a health
        player.hit(); //turns player red
        ball.ballHitPlayer(); //causes the ball to bounce and triggers spawnnewballhit
        if (ball.spawnNewBallHit()) { //spawn new ball the first time player is hit
          balls.add(new Ball(random(0, 400), -17));  //always spawn it with a random x and a y above screen
        }
      }
    }

    player.display(xMove); //for displaying and moving the character, xMove is controlled below and in keypressed

    if (holdA == true) { //moves player Left (see keyPressed)
      xMove--;
    }
    if (holdD == true) { //moves player Right (see keyPressed)
      xMove++;
    }
  }
}


void keyPressed() {

  //when the space bar is pressed and you are not holding it, make screen the opposite colour of what it is
  if (key == ' ' && holdSpace == false) {
    holdSpace = true;
    screenIsBlack = !screenIsBlack;
  }

  if (key == 'a') {  //moves player Left (see Player)
    holdA = true;
  }
  if (key == 'd') { //moves player Right (see Player)
    holdD = true;
  }

  if (key == 'p'){ //when p is pressed, switch to the opposite of gameisOver
  gameIsOver=!gameIsOver;
  health = 3; //reset health to 3
   for (int i = balls.size()-1; i >=0; i--) { 
    balls.remove(0); //remove ALL balls from arraylist
   }
        balls.add(new Ball(random(0, 400), -17)); //add 1 ball to start the sequence
  }
}

void keyReleased() {

  //when space bar is released, change holdSpace to false, allowing it to be pressed again
  if (key == ' ' && holdSpace == true) {
    holdSpace = false;
  }

  if (key == 'a') { //When player releases the button, they stop instantly
    holdA = false;
  }
  if (key == 'd') { //When player releases the button, they stop instantly
    holdD = false;
  }
}

void displayGameOver() { //what displays when gameisover = true
  background(252, 0, 0);
  textSize(50);
  text("press P to start", 50, 200);
}
