//Eric Li
//2/18/2026

//Build in variables
//mouseX mouseY: these are the coordinates for your mouse pointer

//define your own variables here
int y;

void setup() {
  size(600, 600);
  y = 100;//set the starting value
} //end of setup

void draw() {
  background(255);
  strokeWeight(1);
  ellipse(0, y, 100, 100);
  y = y + 1;
} //end of draw
