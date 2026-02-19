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
  ellipse(300, y, 150, 150);
  ellipse(100, x, 150, 150);
  x = x + 1;
  y = y - 1;
  if (x > 475) {
    x = -75;
    y = 475;
  }
}
