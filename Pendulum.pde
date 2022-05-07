public class Pendulum {
  private PVector pendBot;
  private float len;

  public Pendulum(float length) {
    pendBot = new PVector();
    len = length;
  }

  public void draw(PVector pos, float theta, float phi) {
    pendBot
      .set(sin(theta)*cos(phi), sin(theta)*sin(phi),-cos(theta))
      .setMag(len)
      .add(pos);

    push();

    stroke(#a349a4);
    strokeWeight(8);
    line(pos.x,pos.y,pos.z, pendBot.x, pendBot.y, pendBot.z);

    noStroke();
    fill(#a349a4);
    translate(pendBot.x, pendBot.y, pendBot.z);
    sphere(len*0.03f);

    pop();
  }
}
