float refLen;

/* Camera control variables */
float camPitch = 0.0f;
float camYaw = 0.0f;
float camZoom = 1.0f;
float camRotationSensitivity = 0.01f;
float camZoomSensitivity = 0.01f;


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
  drawCartesianAxes(refLen / 2);
  stroke(0);
  box(refLen / 4);
}

void positionCamera() {
  final float minZoom = 0.2f;
  final float maxZoom = 5.0f;

  if (mousePressed) {
    if (mouseButton == LEFT) {
      camPitch += -(mouseY - pmouseY) * camRotationSensitivity;
      camYaw   += (mouseX - pmouseX) * camRotationSensitivity;
    } else if (mouseButton == RIGHT) {
      float gain = 1.0f - (mouseY - pmouseY) * camZoomSensitivity;
      camZoom = max(min(camZoom * gain, maxZoom), minZoom);
    }
  }

  rotateX(camPitch);
  rotateY(camYaw);
  scale(camZoom, camZoom, camZoom);
}

void drawCartesianAxes(float len) {
  stroke(#f00000);            // red
  line(0, 0, 0, len, 0, 0);   // x
  
  stroke(#00f000);            // green
  line(0, 0, 0, 0, len, 0);   // y
  
  stroke(#0000f0);            // blue
  line(0, 0, 0, 0, 0, len);   // z
}