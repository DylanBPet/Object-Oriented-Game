class Player {
  color c; //use to change color of player
  int d = 20; //diameter of head
  PVector head; //head pvector

  Player() {
    //initialize the pvector
    head = new PVector(22, 300);
  }



  void display(float tempX) { //display tempx, used to change the x value and move the player
    head.add(tempX, 0);
    if (head.x <= 0) { //if head goes to edge of screen, move it back onto screen
      head.x = 1;
      tempX = 1;
    } else if (head.x >= 400) {
      head.x = 399;
      tempX = 399;
    }
    fill(c); //color of player
    noStroke(); //no outline
    rectMode(CORNER); //rectangle mode
    rect(head.x-4.5, head.y+9, 9, 25); //body of player, is based off where the head it
    ellipseMode(CENTER); //ellipse mode
    ellipse(head.x, head.y, d, d); //head of player
  }


  void hit() { //when the player is hit, change color to red
    c = color(252, 0, 0);
  }
}
