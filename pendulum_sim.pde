float refLen;

int frameCnt = 0;
float phi = 0.0f;

private final CustomCam customCam = new CustomCam();
private Pendulum pendulum;

PVector pendTop = new PVector();

void setup() {
  size(960, 540, P3D);
  surface.setTitle("Pendulum sim");
  surface.setResizable(false);
  surface.setLocation(100, 100);
  surface.setAlwaysOnTop(true);

  refLen = min(width, height);
  pendulum = new Pendulum(refLen);
}

void draw() {
  float t = frameCnt / 60.0;

  phi += (2.0f/60.0f*PI) % (2.0f*PI);
  pendTop.set(refLen*sin(PI*0.2f*t), refLen/2*cos(PI*0.6f*t), 0);

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
  pendulum.draw(pendTop, PI/24.0f, phi);
  popMatrix();

  popMatrix();

  frameCnt = (frameCnt + 1) % 600;
}

void drawField() {
  drawSceneGrids();
  drawCartesianAxes(refLen / 4);
}

