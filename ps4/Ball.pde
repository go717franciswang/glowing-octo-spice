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
  
  public void run() {
    display();
    move();
    gravity();
  }
  
  public boolean outOfRange() {
    
  }
  
  private void move() {
    x += speedX;
    y += speedY;
  }
  
  public void suspend() {
    speedY = 0;
  }
  
  private void gravity() {
    speedY += 1;
  }
  
  public void hop() {
    speedY = -20;
  }
  
  public void toLeft() {
    speedX = -10;
  }
  
  public void toRight() {
    speedX = 10;
  }
  
  public void toCenter() {
    speedX = 0;
  }
  
  private void display() {
    pushMatrix();
    translate(x, y, z);
    sphere(radius);
    popMatrix();
  }
} 
