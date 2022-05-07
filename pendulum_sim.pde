float refLen;

int frameCnt = 0;

private final CustomCam customCam = new CustomCam();

void setup() {
  size(960, 540, P3D);
  surface.setTitle("Pendulum sim");
  surface.setResizable(false);
  surface.setLocation(100, 100);
  surface.setAlwaysOnTop(true);

  refLen = min(width, height);
}

void draw() {
  float t = frameCnt / 60.0;
  float theta = PI/6.0f*sin(2.0f*PI*0.5*t);
  float phi   = 0; //PI/6.0f*cos(2.0f*PI*0.5*t);

  background(240);

  pushMatrix();
  translate(width/2, height/2);
  scale(1, -1, 1);
  rotateX(-PI/2);

  customCam.light();
  customCam.apply();

  drawField();

  pushMatrix();
  translate(0, 0, refLen/2);
  drawPendulum(refLen, theta, phi);
  popMatrix();

  popMatrix();

  frameCnt = (frameCnt + 1) % 600;
}

void drawField() {
  drawSceneGrids();
  drawCartesianAxes(refLen / 4);
}

void drawPendulum(float len, float theta, float phi) {
  push();

  stroke(#a349a4);
  strokeWeight(8);

  rotateZ(phi);
  rotateY(-theta);

  line(0,0,0, 0,0,-len);

  noStroke();
  fill(#a349a4);

  translate(0,0,-len);
  sphere(len*0.03f);

  pop();
}