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

Ball b;

void setup() {
  size(800, 800, OPENGL);
  frameRate(50);
  noStroke();
  /*
  b1 = new Block(400, 400, 50, 50, -1000, 10);
  b2 = new Block(300, 400, 50, 50, -1000, 20);
  b3 = new Block(500, 400, 50, 100, -1000, 30);
  */
  
  b = new Ball(400, 400);
}

void draw() {
  lights();
  background(0);
  
  camera(width/2, height*0.15, 700,
         width/2, height/2, 0,
         0, 1, 0);
  
  b.run();

/*
  b1.run();
  b2.run();
  b3.run();
  */
}

void keyPressed() {
  switch(keyCode) {
    case 37: b.toLeft(); break;
    case 39: b.toRight(); break;
    case 32: b.hop(); break; 
  }
}

void keyReleased() {
  switch(keyCode) {
    case 37:
    case 38: b.toCenter(); break;
  }
}
