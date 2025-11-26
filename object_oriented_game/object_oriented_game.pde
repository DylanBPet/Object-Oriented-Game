boolean gameIsOver = true;    //is the game over(true) or not(false)

boolean screenIsBlack = false; //is the screen black or not
boolean holdSpace = false;  //this is for if the player holds space, it does not flash between white and black background

boolean holdA = false;     //is the player holding the A key
boolean holdD = false;      //is the player holding the D key

ArrayList<Ball> balls;
//Ball[] ball = new Ball[ballNumber];

void setup(){
  size (400, 400);
  
  //initialize arraylist
 balls = new ArrayList<Ball>();
  balls.add(new Ball());
}


void draw(){
  if(screenIsBlack == true){
   background(0); 
  } else {
    background(255); 
  }
  
 
  
  for (int i = balls.size()-1; i >=0 ; i--){
   Ball ball = balls.get(i);
   ball.display();
   ball.fall();
   ball.bounce();
   if(ball.spawnNewBall()){
    balls.add(new Ball()); 
   }
  }
  
 /*
  for(int i = 0; i<ball.size(); i++){
  Ball ball = ball.get(i);
  ball[i].display(); //display the balls
  ball[i].fall(); //make the balls fall
  ball[i].bounce(); //makes the ball bounce when it reaches bottom of screen
  
  if (ball[i].spawnNewBall(ball[i])){ //when the ball reaches the bottom for the first time, spawn another ball
  
  }
  }
  */
  
}


void keyPressed(){
 
      //when the space bar is pressed and you are not holding it, make screen the opposite colour of what it is
  if(key == ' ' && holdSpace == false){
    holdSpace = true;
   screenIsBlack = !screenIsBlack; 
  }
  
}

void keyReleased(){
  
  //when space bar is released, change holdSpace to false, allowing it to be pressed again
  if(key == ' ' && holdSpace == true){
    holdSpace = false;
    
  } 
  
  
}
