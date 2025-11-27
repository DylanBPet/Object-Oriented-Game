class Player {
  color c;
  int d = 20;
  PVector head;

  Player(){
    head = new PVector(22, 300);
  }



  void display(float tempX) {
    head.add(tempX, 0);
    fill(c);
    noStroke();
    rectMode(CORNER);
    rect(head.x-4.5, head.y+9, 9, 25);
    ellipseMode(CENTER);
    ellipse(head.x, head.y, d, d);
  }

  
  void hit(){
   c = color(252, 0, 0); 
  }
}
