class Player {
  color c; //use to change color of player
  int d = 20; //diameter of head
  PVector head; //head pvector

  Player(){
    //initialize the pvector
    head = new PVector(22, 300);
  }



  void display(float tempX) { //display tempx, used to change the x value and move the player
    head.add(tempX, 0);
    fill(c);
    noStroke();
    rectMode(CORNER);
    rect(head.x-4.5, head.y+9, 9, 25); //body of player, is based off where the head it
    ellipseMode(CENTER);
    ellipse(head.x, head.y, d, d); //head of player
  }

  
  void hit(){ //when the player is hit, change color to red
   c = color(252, 0, 0); 
  }
}
