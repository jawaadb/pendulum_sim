public class Pendulum {
  private PVector pendBot;
  private float len;
  private static final int maxTrailCnt = 60*5;
  private int trailCnt = 0;
  private int trailOffset = 0;

  private PVector[] topTrail = new PVector[maxTrailCnt];
  private PVector[] botTrail = new PVector[maxTrailCnt];

  public Pendulum(float length) {
    pendBot = new PVector();
    len = length;

    for (int i = 0; i < maxTrailCnt; ++i) {
      topTrail[i] = new PVector();
      botTrail[i] = new PVector();
    }
  }

  public void draw(PVector pos, float theta, float phi) {
    pendBot
      .set(sin(theta)*cos(phi), sin(theta)*sin(phi),-cos(theta))
      .setMag(len)
      .add(pos);

    updateTrail(pos, pendBot);
    drawTrail(topTrail);
    drawTrail(botTrail);

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

  private void updateTrail(PVector ptTop, PVector ptBot) {
    int idx = (trailOffset + trailCnt) % maxTrailCnt;

    topTrail[idx].set(ptTop.x, ptTop.y, ptTop.z);
    botTrail[idx].set(ptBot.x, ptBot.y, ptBot.z);

    if (trailCnt != maxTrailCnt) {
      trailCnt++;
    } else {
      trailOffset = (trailOffset + 1) % maxTrailCnt;
    }
  }

  private void drawTrail(PVector[] vArr) {
    if (trailCnt<2) {return;}

    push();
    noFill();
    stroke(0);
    strokeWeight(4);
    beginShape();

    for (int i = 0; i < trailCnt; ++i) {
      int idx = (trailOffset + i) % maxTrailCnt;
      vertex(vArr[idx].x,vArr[idx].y,vArr[idx].z);
    }

    endShape();
    pop();
  }
}
