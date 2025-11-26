boolean gameIsOver = true;    //is the game over(true) or not(false)

boolean screenIsBlack = false; //is the screen black or not
boolean holdSpace = false;  //this is for if the player holds space, it does not flash between white and black background

boolean holdA = false;     //is the player holding the A key
boolean holdD = false;      //is the player holding the D key

void setup(){
  size (400, 400);
  
}


void draw(){
  
  if(screenIsBlack == true){
   background(0); 
  } else {
    background(255); 
  }
  
}

void keyPressed(){
 
  if(key == ' ' && holdSpace == false){
    holdSpace = true;
   screenIsBlack = !screenIsBlack; 
  }
  
}

void keyReleased(){
  if(key == ' ' && holdSpace == true){
    holdSpace = false;
  } 
  
  
}
