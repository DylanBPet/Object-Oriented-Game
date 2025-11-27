class Ball {
  PVector gravity; //will be added to balls y position
  PVector acceleration; //will be added to gravity
  PVector ball; //controls the position of the ball
  float diameter = 34; //the diameter of the ball, will be used for hit detection
  float x; //the ball spawns at a random x
  float y; //ball will spawn offscreen

  boolean ballReachedBottom = false; //for detecting when to spawn a new ball
  boolean ballHasHitPlayer = false;  //for detecting when to spawn a new ball
  int onlySpawnFirstTime = 1; //this is so it only spawns a new ball ONCE per ball

  Ball(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    gravity = new PVector(0, 0); //will be added to balls y position
    acceleration = new PVector(0, 0.05);  //will be added to gravity
    ball = new PVector(x, y); //controls the position of the ball
  }

  void display() { //display the ball
    fill(255); //the color is very important so it hides the display depending on the background
    ellipse(ball.x, ball.y, diameter, diameter);
  }

  void fall() { //causes balls to fall twoards bottom of screen

    gravity.add(acceleration);
    ball.add(gravity);
  }

  void bounce() { //controls when the balls will bounce, and how bouncy they are

    if (ball.y >= 318) { //when ball reaches the bottom bar
      gravity.y = -5; //change gravity so it increases
      acceleration.y = acceleration.y * -1; //temporarily reverse acceleration
      ballReachedBottom = true; //for spawning a new ball
      onlySpawnFirstTime = 2; //so it only spawns the first time it happends
    }
    acceleration.y = 0.05; //reset acceleration so they begin to fall again
  }

  boolean spawnNewBall() { //this controls when a new ball spawns
    if (ball.y >= 316 && ballReachedBottom == false) { //it is a few less than bounce because it needs to happen BEFORE bounce changes ballreachedBottom to true
      return true;
    } else {
      return false;
    }
  }

  boolean hitDetection(float xMove) { //hit detection for when ball is in contact with player head
    float distance = dist(xMove+22, 300, ball.x, ball.y); //hit detection distance is slightly smaller because i found it felt more fair to the player
    if (distance < 34/2+9) {
      return true;
    } else {
      return false;
    }
  }

  void ballHitPlayer() { //when the ball hits the player
        ballHasHitPlayer = false;   //this is so it spawns a new ball
    gravity.y = -5; //change gravity so it increases
    acceleration.y = acceleration.y * -1; //temporarily reverse acceleration
    acceleration.y = 0.05; //reset acceleration so they begin to fall a
    if(onlySpawnFirstTime == 1){ //so it only spawns a new ball once
        ballHasHitPlayer = true;
    }
        onlySpawnFirstTime = 2;
  }
   boolean spawnNewBallHit() { //this controls when a new ball spawns
    if (ballHasHitPlayer == true) { //it is a few less than bounce because it needs to happen BEFORE bounce changes ballreachedBottom to true
      return true;
    } else {
      return false;
    }
  }
}
