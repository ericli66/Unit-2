int mountainX = 0;

void setup() {
  size(800, 600, P2D);
}

void draw() {
  background(50, 100, 150); // Dark blue sky

  noStroke();
  fill(220);
  quad(0, 600, 0, 400, 800, 200, 800, 600);
  //draw mountains
  mountains(mountainX, 0);
  mountainX = mountainX + 1;
  //reset mountains
  if (mountainX >850) {
    mountainX = -100;
  }
}

void mountains(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(200);
  triangle(0, 250, 100, 0, 200, 250);
  triangle(-150, 250, 0, 0, 100, 250);
  popMatrix();
}

void snow_flakes(int x, int y, 
