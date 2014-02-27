// single block moving toward you, and disappearing 
// converting to a block object that can be easily created
// ball that can go left or right controlled by arrow key
// ball that can bounce controlled by space
// bouncing ball that reduce in height and eventually stablizes
// collision detection of ball and blocks
// additional properties on a block such that disappearing, speed up, and extra bouncy

Controller controller;

void setup() {
  size(800, 800, OPENGL);
  frameRate(50);
  noStroke();
  
  controller = new Controller();
}

void draw() {
  lights();
  background(0);
  
  camera(width/2, height*0.15, 700,
         width/2, height/2, 0,
         0, 1, 0);
  
  controller.run();
}

void keyPressed() {
  switch(keyCode) {
    case 37: controller.toLeft(); break;
    case 39: controller.toRight(); break;
    case 32: controller.hop(); break; 
  }
}

void keyReleased() {
  switch(keyCode) {
    case 37:
    case 38: controller.toCenter(); break;
  }
}
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
class Controller {
  private Ball ball;
  private ArrayList blocks;
  
  Controller() {
    ball = new Ball(400, 400);
    
    blocks = new ArrayList();
    blocks.add(new Block(400, 400, 50, 50, 1000, 0));
    blocks.add(new Block(300, 400, 50, 50, 1000, 0));
    blocks.add(new Block(500, 400, 50, 100, 1000, 0));
  }
  
  void run() {
    ball.run();
    
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i); 
      block.run();
    }
  }
  
  void toLeft() {
    ball.toLeft();
  }
  
  void toRight() {
    ball.toRight();
  }
  
  void toCenter() {
    ball.toCenter();
  }
  
  void hop() {
    ball.hop();
  }
}

