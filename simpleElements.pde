void drawCartesianAxes(float len) {
  pushStyle();

  strokeWeight(4);
  stroke(#f00000);            // red
  line(0, 0, 0, len, 0, 0);   // x
  
  stroke(#00f000);            // green
  line(0, 0, 0, 0, len, 0);   // y
  
  stroke(#0000f0);            // blue
  line(0, 0, 0, 0, 0, len);   // z

  popStyle();
}

void drawGrid(float w, float h, int nW, int nH) {
  // Draw x-lines
  for (int i = 0; i < nW+1; ++i) {
    float xPos = i * (w / nW);
    line(xPos, 0, xPos, h);
  }

  // Draw y-lines
  for (int i = 0; i < nH+1; ++i) {
    float yPos = i * (h / nH);
    line(0, yPos, w, yPos);
  }
}

void drawSceneGrids() {
  pushStyle();

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

  popStyle();
}
