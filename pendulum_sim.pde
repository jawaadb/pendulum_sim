float refLen;

int frameCnt = 0;
float phi = 0.0f;

PVector pendPos = new PVector(0, 0);

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

  phi += (2.0f/60.0f*PI) % (2.0f*PI);
  pendPos.set(refLen*sin(2.0f*PI*0.1f*t), refLen/2*cos(2.0f*PI*0.3f*t));

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
  drawPendulum(pendPos, refLen, PI/24.0f, phi);
  popMatrix();

  popMatrix();

  frameCnt = (frameCnt + 1) % 600;
}

void drawField() {
  drawSceneGrids();
  drawCartesianAxes(refLen / 4);
}

void drawPendulum(PVector pos, float len, float theta, float phi) {
  push();

  stroke(#a349a4);
  strokeWeight(8);

  translate(pos.x, pos.y, pos.z);
  rotateZ(phi);
  rotateY(-theta);

  line(0,0,0, 0,0,-len);

  noStroke();
  fill(#a349a4);

  translate(0,0,-len);
  sphere(len*0.03f);

  pop();
}