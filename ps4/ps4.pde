// single block moving toward you, and disappearing 
// converting to a block object that can be easily created
// ball that can go left or right controlled by arrow key
// ball that can bounce controlled by space
// bouncing ball that reduce in height and eventually stablizes
// collision detection of ball and blocks
// additional properties on a block such that disappearing, speed up, and extra bouncy

Block b1;
Block b2;
Block b3;

void setup() {
  size(800, 800, OPENGL);
  frameRate(50);
  noStroke();
  
  b1 = new Block(400, 400, 50, 50, -1000, 10);
  b2 = new Block(300, 400, 50, 50, -1000, 20);
  b3 = new Block(500, 400, 50, 100, -1000, 30);
}

void draw() {
  lights();
  background(0);
  
  camera(width/2, height*0.15, 700,
         width/2, height/2, 0,
         0, 1, 0);

  b1.move();
  b1.display();
  
  b2.move();
  b2.display();
  
  b3.move();
  b3.display();
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

