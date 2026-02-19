//Eric Li
//02/18/2026

int x;

void setup() {
  size(400, 400);
  x = 0;
  strokeWeight(5);
}

void draw() {
  background(255);
  ellipse(200, x, 150, 150);
  x = x + 1;
  if (x > 500) {
    x = -50;
  }
}
