public class CustomCam {
  private float camPitch = 0.5f;
  private float camYaw = -0.5f;
  private float camZoom = 0.5f;
  private float camRotationSensitivity = 0.01f;
  private float camZoomSensitivity = 0.01f;

  public void apply() {
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

  public void light() {
    directionalLight(60,40,40,1,0,0);
    directionalLight(40,40,60,-1,1,0);
    directionalLight(80,80,80,0,0,1);
    ambientLight(120, 120, 120);
  }
}