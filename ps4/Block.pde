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
  
  boolean isContact(Ball ball) {
    if (ball.x()+ball.radius() < x-w/2 || ball.x()-ball.radius() > x+w/2) { return false; }
    if (ball.y()+ball.radius() < y-h/2 || ball.y()+ball.radius() > y+h/2) { return false; }
    if (ball.z() < z-d/2 || ball.z() > z+d/2) { return false; }
    return true;
  }
  
  void run() {
    display();
    move();
  }
  
  void move() {
    z += dz;
  }
  
  void display() {
    pushMatrix();
    translate(x, y, z);
    box(w, h, d);
    popMatrix();
  }
}
