//Eric Li
//02/18/2026

int x;
int y;

void setup() {
  size(400, 400);
  x = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  ellipse(y, 200, x, x);
  x = x + 1;
  y = y + 5;
  if (y > 475) {
    x = 10;
    y = -50;
  }
}
