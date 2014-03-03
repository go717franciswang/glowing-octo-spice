class Block {
  private int x, y, z = -0, w, h, d;
  private int dz;
  
  Block(int x, int y, int w, int h, int d, int dz) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.d = d;
    this.dz = dz;
  }
  
  public boolean isContact(Ball ball) {
    if (ball.x()+ball.radius() < x-w/2 || ball.x()-ball.radius() > x+w/2) { return false; }
    if (ball.y()+ball.radius() < y-h/2 || ball.y()+ball.radius() > y+h/2) { return false; }
    if (ball.z() < z-d/2 || ball.z() > z+d/2) { return false; }
    return true;
  }
  
  public void run() {
    display();
    move();
  }
  
  public boolean outOfRange() {
    return z-d/2 > 0;
  }
  
  private void move() {
    z += dz;
  }
  
  private void display() {
    pushMatrix();
    translate(x, y, z);
    box(w, h, d);
    popMatrix();
  }
}
