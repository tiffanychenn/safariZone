class MyShape {
  private float startx, starty, startl, startw, starts, starte;
  private float x, y, l, w, s, e;
  private int t;
  private boolean isReset;

  MyShape(float x, float y, float l, float w, int t) {
    startx = x;
    starty = y;
    startl = l;
    startw = w;
    starts = 0;
    starte = 0;
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.s = 0;
    this.e = 0;
    this.t = t;
    isReset = true;
  }

  MyShape(float x, float y, float l, float w, float s, float e, int t) {
    startx = x;
    starty = y;
    startl = l;
    startw = w;
    starts = s;
    starte = e;
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.s = s;
    this.e = e;
    this.t = t;
    isReset = true;
  }

  public void display() {
    stroke(0);
    fill(0);
    if (t == 0) {
      rect(x, y, l, w);
    } else if (t == 1) {
      arc(x, y, l, w, s, e, PIE);
    }
    noStroke();
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }
  
  public float getE() {
    return e;
  }

  public boolean getReset() {
    return isReset;
  }

  public void incrementX(float k) {
    x += k;
    isReset = false;
  }

  public void incrementY(float k) {
    y += k;
    isReset = false;
  }
  
  public void incrementE(float k) {
    e += k;
    isReset = false;
  }

  public void setX(float k) {
    x = k;
    isReset = false;
  }

  public void setY(float k) {
    y = k;
    isReset = false;
  }
  
  public void setE(float k) {
    e = k;
    isReset = false;
  }

  public void reset() {
    x = startx;
    y = starty;
    l = startl;
    w = startw;
    s = starts;
    e = starte;
  }
}