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

  drawScene();

  popMatrix();
}

void drawScene() {
  drawSceneGrids();
  drawCartesianAxes(refLen / 2);
  strokeWeight(2);
  stroke(0);
  box(refLen / 4);
}
