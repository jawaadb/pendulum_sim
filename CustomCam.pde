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
}