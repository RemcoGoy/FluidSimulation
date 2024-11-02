final int N = 128;
final int iter = 4;
final int SCALE = 5;
float t = 0;

Fluid fluid;

void settings() {
  size(N * SCALE, N * SCALE);
}

void setup() {
  fluid = new Fluid(0.5, 0, 0);
}

void draw() {
  background(0);
  int cx = width/SCALE/2;
  int cy = height/SCALE/2;
  
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      fluid.addDensity(cx+i, cy+j, random(300, 500));
    }
  }

  
  float angle = noise(t) * TWO_PI;
  PVector v = PVector.fromAngle(angle);
  v.mult(0.1);
  t += 0.1;
  fluid.addVelocity(cx, cy, v.x, v.y);
  
  fluid.step();
  fluid.renderD();
  fluid.fadeD();
}
