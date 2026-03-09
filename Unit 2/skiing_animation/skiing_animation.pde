float mountainX;

float cloudsX1;
float cloudsX2;
float cloudsX3;

float cloudSpeed1, cloudSpeed2, cloudSpeed3;

float snowflakeX, snowflakeY, snowflakesize, snowflakeangle;

float skierSize, sizeChange, skierY;

void setup() {
  size(800, 600, P2D);

  mountainX = 0;

  cloudsX1 = 0;
  cloudsX2 = 200;
  cloudsX3 = 500;

  cloudSpeed1 = random(0.5, 1.5);
  cloudSpeed2 = random(1.0, 2.0);
  cloudSpeed3 = random(1.5, 2.5);

  skierSize = 1;
  skierY = 400;
  sizeChange = 0.01;

  snowflakeX = 0;
  snowflakeY = 0;
  snowflakesize = 0.1;
  snowflakeangle = 0;
}

void draw() {
  background(50, 100, 150);
  noStroke();

  // mountains
  mountains(mountainX, 0);
  mountainX = mountainX + 0.5;

  if (mountainX > 950) {
    mountainX = -500;
  }

  // cloud 1
  clouds(cloudsX1, 300);
  cloudsX1 = cloudsX1 + cloudSpeed1;
  if (cloudsX1 > 1500) {
    cloudsX1 = -500;
    cloudSpeed1 = random(0.5, 1.5);
  }

  // cloud 2
  clouds(cloudsX2, 220);
  cloudsX2 = cloudsX2 + cloudSpeed2;
  if (cloudsX2 > 1500) {
    cloudsX2 = -500;
    cloudSpeed2 = random(1.0, 2.0);
  }

  // cloud 3
  clouds(cloudsX3, 150);
  cloudsX3 = cloudsX3 + cloudSpeed3;
  if (cloudsX3 > 1500) {
    cloudsX3 = -500;
    cloudSpeed3 = random(1.5, 2.5);
  }

  // ski slope
  fill(240);
  quad(0, 600, 0, 400, 800, 200, 800, 600);

  //skier
  skier(400, skierY, skierSize);

  //change size
  skierSize = skierSize + sizeChange;

  //moves up when getting smaller
  if (sizeChange < 0) {
    skierY = skierY - 1.5;
  }

  //moves down when getting bigger
  if (sizeChange > 0) {
    skierY = skierY + 1.5;
  }

  //switch directions
  if (skierSize > 1.8) {
    sizeChange = -0.006;
  }

  //sweitch directions
  if (skierSize < 1) {
    sizeChange = 0.006;
  }

  drawsnowflake(snowflakeX, snowflakeY, snowflakesize, snowflakeangle);
  snowflakeX = snowflakeX + 1;
  snowflakeY = snowflakeY + 2;

  snowflakeangle = snowflakeangle + 5;
  if (snowflakeY > 600) {
    snowflakeX = 150;
    snowflakeY = 0;
  }
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
  ellipse(-350, -220, 250, 100);
  ellipse(200, -300, 250, 150);
  ellipse(280, -300, 350, 150);
  fill(150);
  ellipse(-100, -300, 250, 100);
  ellipse(100, -300, 250, 100);
  ellipse(-200, -200, 250, 100);
  ellipse(300, -200, 250, 100);
  fill(230);
  ellipse(-300, -300, 250, 100);
  ellipse(-100, -150, 250, 100);
  popMatrix();
}

void skier(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);

  // skis
  stroke(250, 110, 20);
  strokeWeight(3);
  line(20, 20, -20, 30);
  stroke(2, 85, 94);
  line(15, 15, -25, 25);

  // body
  stroke(0);
  line(0, -20, 0, 10);

  // arms
  line(0, -10, -15, 0);
  line(0, -10, 15, 0);

  // legs
  line(0, 10, -10, 20);
  line(0, 10, 10, 20);

  // head
  fill(255, 220, 180);
  noStroke();
  ellipse(0, -30, 15, 15);

  popMatrix();
}

// snowflake
void drawsnowflake(float x, float y, float s, int angle) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(radians(angle));

  // Draw 6 arms by rotating 60 degrees each time
  drawArm(60);
  drawArm(120);
  drawArm(180);
  drawArm(240);
  drawArm(300);
  drawArm(0);

  popMatrix();
}

// arm of snow flake
void drawArm(int angle) {
  pushMatrix();
  rotate(radians(angle));
  line(0, 0, 0, -300);      // Main spine

  // Bottom branches
  line(0, -80, 50, -130);
  line(0, -80, -50, -130);

  // Middle branches
  line(0, -160, 40, -200);
  line(0, -160, -40, -200);

  // Top branches
  line(0, -240, 25, -265);
  line(0, -240, -25, -265);
  popMatrix();
}
