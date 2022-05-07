void drawCartesianAxes(float len) {
  strokeWeight(4);
  stroke(#f00000);            // red
  line(0, 0, 0, len, 0, 0);   // x
  
  stroke(#00f000);            // green
  line(0, 0, 0, 0, len, 0);   // y
  
  stroke(#0000f0);            // blue
  line(0, 0, 0, 0, 0, len);   // z
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
