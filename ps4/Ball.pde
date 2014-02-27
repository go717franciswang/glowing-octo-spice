class Ball {
  private int x, y;
  private int speedX = 0;
  private int speedY = 5;
  
  Ball(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void run() {
    display();
    move();
    gravity();
  }
  
  void move() {
    x += speedX;
    y += speedY;
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
    translate(x, y, -100);
    sphere(50);
    popMatrix();
  }
} 
