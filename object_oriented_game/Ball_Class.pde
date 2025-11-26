class Ball {
  PVector gravity; //will be added to balls y position
  PVector acceleration; //will be added to gravity
  PVector ball; //controls the position of the ball
  float diameter = 34; //the diameter of the ball, will be used for hit detection
  float x = random(0, 400); //the ball spawns at a random x
  float y = -17; //ball will spawn offscreen

boolean ballReachedBottom = false;

  Ball() {

    gravity = new PVector(0, 0); //will be added to balls y position
    acceleration = new PVector(0, 0.05);  //will be added to gravity
    ball = new PVector(x, y); //controls the position of the ball
  }

  void display() { //display the ball

    fill(0); //the color is very important so it hides the display depending on the background
    ellipse(ball.x, ball.y, diameter, diameter);
  }

  void fall() { //causes balls to fall twoards bottom of screen

    gravity.add(acceleration);
    ball.add(gravity);
  }

  void bounce() { //controls when the balls will bounce, and how bouncy they are

    if (ball.y >= 335) { //when ball reaches the bottom bar
      gravity.y = -5; //change gravity so it increases
      acceleration.y = acceleration.y * -1; //temporarily reverse acceleration
      ballReachedBottom = true;
    }
    acceleration.y = 0.05; //reset acceleration so they begin to fall again
  }

  boolean spawnNewBall() { //this controls when a new ball spawns
    if (ball.y >= 334 && ballReachedBottom == false) { //it is 1 less than bounce because it needs to happen BEFORE bounce changes ballreachedBottom to true
      return true;
    } else {
      return false;
    }
    
  }
  
}
