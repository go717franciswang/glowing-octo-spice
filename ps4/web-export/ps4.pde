// single block moving toward you, and disappearing 
// converting to a block object that can be easily created
// ball that can go left or right controlled by arrow key
// ball that can bounce controlled by space
// bouncing ball that reduce in height and eventually stablizes
// collision detection of ball and blocks
// additional properties on a block such that disappearing, speed up, and extra bouncy

int d = -500;

void setup() {
  size(800, 800, OPENGL);
  frameRate(50);
  noStroke();
  
}

void draw() {
  lights();
  background(0);
  
  camera(width/2, height*0.15, 700,
         width/2, height/2, 0,
         0, 1, 0);

  
  translate(width/2, height/2, d);
  println(d);
  d += 10;
  int dim = 50;
  pushMatrix();
  box(dim, dim, 500);
  popMatrix();
}

class Block {
  private int x, y, z = -1000, w, h, d;
  private int dz;
  
  Block(x, y, w, h, d, dz) {
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


