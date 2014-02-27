class Block {
  private int x, y, z = -1000, w, h, d;
  private int dz;
  
  Block(int x, int y, int w, int h, int d, int dz) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.d = d;
    this.dz = dz;
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
