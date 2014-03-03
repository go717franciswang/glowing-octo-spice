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
  
  public int getx() { return x; }
  public int gety() { return y; }
  public int getz() { return z; }
  public int getRadius() {return radius; }
  
  public void run() {
    display();
    move();
    gravity();
  }
  
  public boolean outOfRange() {
    return y > height;
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
