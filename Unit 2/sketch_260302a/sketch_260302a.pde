// Simplified Processing example for heavy snow
int numFlakes = 1000;
float[] x = new float[numFlakes];
float[] y = new float[numFlakes];
float[] speed = new float[numFlakes];

void setup() {
  size(800, 600);
  for (int i = 0; i < numFlakes; i++) {
    x[i] = random(-100, 800);
    y[i] = random(-500, -10);
    speed[i] = random(1, 4);
  }
}

void draw() {
  background(50, 100, 150); // Dark blue sky
  fill(250);
  triangle(300, 200, 600, 100, 800, 600);
  fill(255);
  noStroke();
  
  for (int i = 0; i < numFlakes; i++) {
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
