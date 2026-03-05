// Simplified Processing example for heavy snow//
int numFlakes = 1000;
float[] x = new float[numFlakes];
float[] y = new float[numFlakes];
float[] speed = new float[numFlakes];
int mountainX = 0;

void setup() {
  size(800, 600, P2D);
  for (int i = 0; i < numFlakes; i++) {
    x[i] = random(-100, 800);
    y[i] = random(-500, -10);
    speed[i] = random(1, 4);
  }
}

void draw() {
  background(50, 100, 150); // Dark blue sky

  noStroke();
  mountains(mountainX, 0);
  mountainX = mountainX + 5;
  if (mountainX >850) {
    mountainX = -100;
  }
    for (int i = 0; i < numFlakes; i++) {
      fill(255);
      ellipse(x[i], y[i], 3, 3);
      y[i] += speed[i]; // Make it fall
      x[i] += random(1); // Slight sway

      // Reset flakes to top
      if (y[i] > height) {
        y[i] = -10;
        x[i] = random(-100, 800);
      }
    }
  }

  void mountains(int x, int y) {
    pushMatrix();
    translate(x, y);
    fill(150);
    triangle(0, 100, 50, 0, 100, 100);
    triangle(-50, 150, 0, 0, 100, 150);
    popMatrix();
  }
