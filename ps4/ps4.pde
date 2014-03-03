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
