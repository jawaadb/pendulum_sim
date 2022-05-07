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
  drawSceneGrids();
  drawCartesianAxes(refLen / 2);
  strokeWeight(2);
  stroke(0);
  box(refLen / 4);
}


void drawSceneGrids() {
  strokeWeight(2);
  stroke(#ffffff);

  final float cW = refLen * 2;
  final float cD = refLen;
  final float cH = refLen;

  pushMatrix();
  translate(-cW/2, -cD/2, cH/2);
  drawGrid(cW, cD, 16, 8);

  stroke(#c0c0c0);
  translate(0,0,-cH);
  drawGrid(cW, cD, 16, 8);
  popMatrix();

  pushMatrix();
  translate(0, cD/2, 0);
  rotateX(PI/2);
  translate(-cW/2, -cH/2);
  drawGrid(cW, cH, 16, 8);
  popMatrix();

  pushMatrix();
  translate(-cW/2, 0, 0);
  rotateY(PI/2);
  translate(-cH/2, -cD/2);
  drawGrid(cH, cD, 8, 8);
  popMatrix();
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
