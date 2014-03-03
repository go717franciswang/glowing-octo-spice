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

void mouseMoved() {
  //println("x: " + mouseX + ", y: " + mouseY);
}
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
class Block {
  private int x, y, z, w, h, d;
  private int dz;
  
  Block(int x, int y, int z, int w, int h, int d, int dz) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
    this.h = h;
    this.d = d;
    this.dz = dz;
  }
  
  public int x() { return x; }
  public int y() { return y; }
  public int z() { return z; }
  
  public boolean isContact(Ball ball) {
    if (ball.x()+ball.radius() < x-w/2 || ball.x()-ball.radius() > x+w/2) { return false; }
    if (ball.y()+ball.radius() < y-h/2 || ball.y()+ball.radius() > y+h/2) { return false; }
    if (ball.z() < z-d/2 || ball.z() > z+d/2) { return false; }
    return true;
  }
  
  public float distanceTo(Block that) {
    return max(0, abs(z - that.z) - d - that.d);
  }
  
  public void run() {
    display();
    move();
  }
  
  public boolean outOfRange() {
    return z-1.5*d > 0;
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
class Controller {
  private Ball ball;
  private ArrayList blocks;
  private Block lastBlock;
  private int zstart = -3000;
  private int startTime;
  private int score = 0;
  private int speed = 20;
  
  private int gameState;
  private final int GAMEON = 1;
  private final int GAMEOVER = 2;
  
  Controller() {
    gameState = GAMEON;
    ball = new Ball(400, 200);
    
    blocks = new ArrayList();
    Block b = new Block(400, 400, -350, 100, 20, 1000-zstart, 20);
    lastBlock = b;
    blocks.add(b);
  }
  
  public void run() {
    animateObjects();
    incrementScore();
    displayScore();
    accelerate();
    cleanUp();
    genBlock();
    gameOver();
  }
  
  private void incrementScore() {
    if (gameState == GAMEON) {
      score += speed;
    }
  }
  
  private void displayScore() {
    textAlign(CENTER);
    switch (gameState) {
      case GAMEON:
        text("Score: " + score, width/2, 100);
        break;
      case GAMEOVER:
        text("Score: " + score + "\nGame Over", width/2, 100);
        break;
    }
  }
  
  private void accelerate() {
    speed++;
  }
  
  private void animateObjects() {
    ball.run();
    if (isContact()) {
      ball.suspend();
    }
    
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i); 
      block.run();
    }
  }
  
  private void gameOver() {
    if (ball.outOfRange()) {
      gameState = GAMEOVER;
    }
  }
  
  private void genBlock() {
    if (lastBlock.z() - zstart > 1000) {
      while (true) {
        Block b = getRandomBlock();
        blocks.add(b);
        if (lastBlock.distanceTo(b) < 100 && random(1) < 0.8) {
          lastBlock = b;
          break;
        }
      }
    }
  }
  
  private Block getRandomBlock() {
    int l = round(random(500, 1000));
    int x = round(random(200, 600));
    int w = round(random(50, 150));
    int h = round(random(20, 100));
    return new Block(x, 400, zstart, w, h, l, speed);
  } 
  
  private void cleanUp() {
    for (int i = blocks.size()-1; i >= 0; i--) {
      Block block = (Block) blocks.get(i);
      if (block.outOfRange()) {
        blocks.remove(i);
      }
    }
  }
  
  private boolean isContact() {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i);
      if (block.isContact(ball)) {
        return true;
      }
    }
    
    return false;
  }
  
  public void toLeft() {
    ball.toLeft();
  }
  
  public void toRight() {
    ball.toRight();
  }
  
  public void toCenter() {
    ball.toCenter();
  }
  
  public void hop() {
    if (isContact()) {
      ball.hop();
    }
  }
}

