float mountainX;

float cloudsX1;
float cloudsX2;
float cloudsX3;

float cloudSpeed1, cloudSpeed2, cloudSpeed3;

float snowflakeX, snowflakeY, snowflakesize, snowflakeangle;
float snowflake2X, snowflake2Y, snowflake2size, snowflake2angle;
float snowflake3X, snowflake3Y, snowflake3size, snowflake3angle;
float snowflake4X, snowflake4Y, snowflake4size, snowflake4angle;

float skierSize, sizeChange, skierY;

float treeX, treeY;

void setup() {
  size(800, 600, P2D);
  
  treeX = 0;
  treeY = 400;

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

  snowflakeX = 400;
  snowflakeY = 0;
  snowflakesize = 0.1;
  snowflakeangle = 0;
  
  snowflake2X = 400;
  snowflake2Y = 0;
  snowflake2size = 0.1;
  snowflake2angle = 0;
  
  snowflake3X = 400;
  snowflake3Y = 0;
  snowflake3size = 0.1;
  snowflake3angle = 0;
  
  snowflake4X = 400;
  snowflake4Y = 0;
  snowflake4size = 0.1;
  snowflake4angle = 0;
}

void draw() {
  background(50, 100, 150);
  noStroke();

  // mountains
  mountains(mountainX, 0);
  mountainX = mountainX + 0.2;

  if (mountainX > 950) {
    mountainX = -600;
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
  
  //draw tree
  tree(treeX, treeY);
  treeX = treeX+7;
  treeY = treeY-2;
  if (treeX > 850) {
    treeX = -50;
    treeY = 400;
  }

  //skier
  skier(500, skierY, skierSize);

  //change size
  skierSize = skierSize + sizeChange;

  //moves up when getting smaller
  if (sizeChange < 0) {
    skierY = skierY - 1.4;
  }

  //moves down when getting bigger
  if (sizeChange > 0) {
    skierY = skierY + 1.4;
  }

  //switch directions
  if (skierSize > 1.8) {
    sizeChange = -0.006;
  }

  //sweitch directions
  if (skierSize < 1) {
    sizeChange = 0.006;
  }

  //snowflake1
  stroke(4);
  pushMatrix();
  drawsnowflake(snowflakeX, snowflakeY+100, snowflakesize, snowflakeangle);
  snowflakeX = snowflakeX + 3;
  snowflakeY = snowflakeY + 2;
  snowflakeangle = snowflakeangle + 5;
  noStroke();
  popMatrix();
  if (snowflakeY > 600) {
    snowflakeX = 150;
    snowflakeY = -150;
  }
  //snowflake2
  stroke(4);
  pushMatrix();
  drawsnowflake(snowflake2X+200, snowflake2Y+500, snowflake2size+0.01, snowflake2angle);
  snowflake2X = snowflake2X + 3;
  snowflake2Y = snowflake2Y + 2;
  snowflake2angle = snowflake2angle + 5;
  noStroke();
  popMatrix();
  if (snowflake2Y > 600) {
    snowflake2X = -200;
    snowflake2Y = -500;
  }
  //snowflake3
  stroke(4);
  pushMatrix();
  drawsnowflake(snowflake3X-10, snowflake3Y-30, snowflake3size+0.05, snowflake3angle);
  snowflake3X = snowflake3X + 2;
  snowflake3Y = snowflake3Y + 2;
  snowflake3angle = snowflake3angle + 5;
  noStroke();
  popMatrix();
  if (snowflake3Y > 600) {
    snowflake3X = -280;
    snowflake3Y = -50;
  }
  //snowflake4
  pushMatrix();
  stroke(4);
  drawsnowflake(snowflake4X+500, snowflake4Y+200, snowflake4size+0.1, snowflake4angle);
  snowflake4X = snowflake4X + 1;
  snowflake4Y = snowflake4Y + 3;
  snowflake4angle = snowflake4angle + 5;
  noStroke();
  popMatrix();
  if (snowflake4Y > 600) {
    snowflake4X = -200;
    snowflake4Y = -200;
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
void drawsnowflake(float x, float y, float s, float angle) {
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

void tree(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  // --- Draw Trunk ---
  fill(100, 60, 20); // Brown
  noStroke();
  rect(-10, 30, 20, 40); // (x, y, width, height)
  
  // --- Draw Tree Body (Triangles) ---
  fill(30, 120, 30); // Dark Green
  
  // Bottom tier
  triangle(0, -50, -60, 40, 60, 40);
  // Middle tier
  triangle(0, -90, -45, -10, 45, -10);
  // Top tier
  triangle(0, -120, -30, -50, 30, -50);
  popMatrix();
}
