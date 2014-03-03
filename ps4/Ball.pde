class Ball {
  private int x, y, z;
  private int speedX = 0;
  private int speedY = 5;
  private int radius = 50;
  
  Ball(int x, int y) {
    this.x = x;
    this.y = y;
    this.z = -100;
  }
  
  public int x() { return x; }
  public int y() { return y; }
  public int z() { return z; }
  public int radius() {return radius; }
  
  void run() {
    display();
    move();
    gravity();
  }
  
  void move() {
    x += speedX;
    y += speedY;
  }
  
  void suspend() {
    speedY = 0;
  }
  
  void gravity() {
    speedY += 1;
  }
  
  void hop() {
    speedY = -20;
  }
  
  void toLeft() {
    speedX = -10;
  }
  
  void toRight() {
    speedX = 10;
  }
  
  void toCenter() {
    speedX = 0;
  }
  
  void display() {
    pushMatrix();
    translate(x, y, z);
    sphere(radius);
    popMatrix();
  }
} 
