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
  ellipse(200, 200, x, x);
  x = x + 1;
  if (x > 600) {
    x = 0;
  }
}
