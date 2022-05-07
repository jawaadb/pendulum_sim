float refLen;

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
  drawPendulum(refLen);
  popMatrix();

  popMatrix();
}

void drawField() {
  drawSceneGrids();
  drawCartesianAxes(refLen / 4);
}

void drawPendulum(float len) {
  push();

  stroke(#a349a4);
  strokeWeight(8);
  line(0,0,0, 0,0,-len);

  noStroke();
  fill(#a349a4);

  translate(0,0,-len);
  sphere(len*0.03f);

  pop();
}