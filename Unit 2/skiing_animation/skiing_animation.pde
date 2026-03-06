float mountainX;
float cloudsX;
float cloudSpeed;

void setup() {
  size(800, 600, P2D);
  cloudsX = 0;
  mountainX = 0;
  cloudSpeed = random(0.5, 2.5);
}

void draw() {
  background(50, 100, 150); // Dark blue sky
  noStroke();
  //draw mountains
  mountains(mountainX, 0);
  mountainX = mountainX + 0.1;
  //reset mountains
  if (mountainX >950) {
    mountainX = -100;
  }
  //moving the clouds
  clouds(cloudsX, 300);
  cloudsX = cloudsX + cloudSpeed;
  //resetting the clouds
  if (cloudsX > 900) {
    cloudsX = -50;
    cloudSpeed = random(0.2, 2.5);
  }
  //ski slope
  fill(220);
  quad(0, 600, 0, 400, 800, 200, 800, 600);
}

void mountains(float x, int y) {
  pushMatrix();
  translate(x, y);
  fill(200);
  triangle(0, 600, 200, 0, 800, 600);
  triangle(-250, 600, 0, -100, 600, 600);
  popMatrix();
}

void clouds(float x, int y) {
  pushMatrix();
  translate(x, y);
  fill(180);
  ellipse(-130, -250, 250, 100);
  fill(200);
  ellipse(0, -200, 200, 100);
  ellipse(0-350, -220, 250, 100);
  ellipse(200, -300, 250, 150);
  ellipse(280, -300, 350, 150);
  fill(150);
  ellipse(-100, -300, 250, 100);
  ellipse(-100, -300, 250, 100);
  ellipse(100, -300, 250, 100);
  ellipse(-200, -200, 250, 100);
  ellipse(300, -200, 250, 100);
  fill(230);
  ellipse(-300, -300, 250, 100);
  ellipse(-100, -150, 250, 100);
  popMatrix();
}
//skier
void skier() {
  stroke(0);
  strokeWeight(2);
  line(-20, 
