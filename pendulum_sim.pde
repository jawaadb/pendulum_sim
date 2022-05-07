float refLen;

/* Camera control variables */
float camPitch = 0.0f;
float camYaw = 0.0f;
float camControlSensitivity = 0.01f;

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

  lights();

  positionCamera();

  drawScene();

  popMatrix();
}

void drawScene() {
  box(refLen / 4);
}

void positionCamera() {
  if (mousePressed) {
    camPitch -= (mouseY - pmouseY) * camControlSensitivity;
    camYaw   += (mouseX - pmouseX) * camControlSensitivity;
  }

  rotateX(camPitch);
  rotateY(camYaw);
}