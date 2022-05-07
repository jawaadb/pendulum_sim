float refLen;

/* Camera control variables */
float camPitch = 0.5f;
float camYaw = -0.5f;
float camZoom = 0.5f;
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
  scale(1, -1, 1);
  rotateX(-PI/2);

  directionalLight(60,40,40,1,0,0);
  directionalLight(40,40,60,-1,1,0);
  directionalLight(80,80,80,0,0,1);
  ambientLight(120, 120, 120);

  positionCamera();

  drawScene();

  popMatrix();
}

void drawScene() {
  drawCartesianAxes(refLen / 2);
  strokeWeight(2);
  stroke(0);
  box(refLen / 4);
}

void positionCamera() {
  final float minZoom = 0.2f;
  final float maxZoom = 5.0f;

  if (mousePressed) {
    if (mouseButton == LEFT) {
      camPitch += (mouseY - pmouseY) * camRotationSensitivity;
      camYaw   += (mouseX - pmouseX) * camRotationSensitivity;
    } else if (mouseButton == RIGHT) {
      float gain = 1.0f - (mouseY - pmouseY) * camZoomSensitivity;
      camZoom = max(min(camZoom * gain, maxZoom), minZoom);
    }
  }

  rotateX(camPitch);
  rotateZ(camYaw);
  scale(camZoom, camZoom, camZoom);
}

void drawCartesianAxes(float len) {
  strokeWeight(4);
  stroke(#f00000);            // red
  line(0, 0, 0, len, 0, 0);   // x
  
  stroke(#00f000);            // green
  line(0, 0, 0, 0, len, 0);   // y
  
  stroke(#0000f0);            // blue
  line(0, 0, 0, 0, 0, len);   // z
}