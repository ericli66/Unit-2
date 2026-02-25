//Eric Li
//2/23/2026

int monsterX;
int monsterAngle;
float monsterSize;

void setup() {
  size(600, 600, P2D);
  monsterX = 0;
  monsterAngle = 0;
}

void draw() {
  background(255);
  monster(monsterX, 300, monsterAngle, monsterSize);
  monsterX = monsterX + 5;
  monsterAngle = monsterAngle + 10;
  monsterSize = monsterSize + 0.005;
  if (monsterX > 800) {
    monsterX = -200;
    monsterAngle = 0;
    monsterSize = 0;
  }
}

//           parameters
void monster(int x, int y, int angle, float s) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  scale(s);

  //ears
  strokeWeight(5);
  fill(255, 0, 0);
  triangle(-50, -100, -100, -70, -150, -140);
  triangle(50, -100, 100, -70, 150, -140);

  //legs
  fill(250, 220, 20);
  rect(-80, 80, 50, 100);
  rect(30, 80, 50, 100);

  //head and body
  ellipse(0, 0, 250, 280);

  //eyes
  fill(255);
  ellipse(-50, -50, 60, 60);
  ellipse(50, -50, 60, 60);
  fill(0);
  ellipse(-48, -50, 20, 20);
  ellipse(50, -50, 20, 20);
  fill(255);
  noStroke();
  ellipse(-45, -52, 5, 5);
  ellipse(47, -52, 5, 5);

  //mouth
  strokeWeight(5);
  stroke(0);
  ellipse(0, 10, 100, 40);

  //teeth
  line(-40, 20, -30, -5);
  line(-30, -5, -20, 25);
  line(-20, 25, -10, -10);
  line(-10, -10, 0, 30);
  line(0, 30, 10, -10);
  line(10, -10, 20, 25);
  line(20, 25, 30, -5);
  line(30, -5, 40, 20);
  popMatrix();
}
