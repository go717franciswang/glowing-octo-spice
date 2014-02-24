color[] eyeColors = {#863D10, #3C5FD6, #77983C, #C4B72A};
AnimatedEye e = getRandomEye(300, 500);

void setup() {
  size(1050, 720);
  background(#FFFFFF);
  smooth();
}

void draw() {
  background(#FFFFFF);
  //println(mouseX + ", " + mouseY);
  noFill();
  
  e.display();
}

AnimatedEye getRandomEye(float x, float y) {
  float r1 = rand(15, 3);
  float r2 = rand(35, 5);
  float l1 = rand(70, 10);
  float l2 = rand(70, 10);
  float h0 = rand(5, 10);
  float h1 = rand(5, 10);
  float h2 = rand(30, 10);
  float h3 = rand(30, 10);;
  float h4 = rand(30, 10);
  float h5 = rand(30, 10);
  float h6 = rand(5, 5);
  float h7 = rand(5, 5);
  float h8 = rand(5, 5);
  float h9 = rand(5, 5);
  color pupilColor = eyeColors[int(random(eyeColors.length))];  
  
  return new AnimatedEye(x, y, r1, r2, l1, l2, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, pupilColor);
}

float rand(float x, float dx) {
  return x + random(-dx, dx);
}

class AnimatedEye {
  private float x, y, r1, r2, l1, l2;
  private float h0, h1, h2, h3, h4, h5, h6, h7, h8, h9;
  private float l0 = 20;
  private color pupilColor;
  private float boundRadius;
  private int coverEyeBallOverflow = 60;
  
  AnimatedEye(float x, float y, float r1, float r2, float l1, float l2,
    float h0, float h1, float h2, float h3, float h4, float h5, float h6, float h7, float h8, float h9,
    color pupilColor) {
    this.x = x;
    this.y = y;
    this.r1 = r1;
    this.r2 = r2;
    this.l1 = l1;
    this.l2 = l2; 
    this.h0 = h0;
    this.h1 = h1;
    this.h2 = h2;
    this.h3 = h3;
    this.h4 = h4;
    this.h5 = h5;
    this.h6 = h6;
    this.h7 = h7;
    this.h8 = h8;
    this.h9 = h9;
    this.pupilColor = pupilColor;
    
    this.boundRadius = max(new float[]{h2,h3,h4,h5});
    println(this.boundRadius);
  }
  
  public void display() {
    strokeWeight(3);
    displayEyeBall();
    displayEyeLids();
  }
  
  private void displayEyeBall() {
    fill(pupilColor);
    float[] xy = bounded(mouseX, mouseY);
    ellipse(xy[0], xy[1], r2*2, r2*2);
    fill(0);
    ellipse(xy[0], xy[1], r1*2, r1*2);
  }
  
  private void displayEyeLids() {
    noFill();
    stroke(#FFFFFF);
    coverOverflow();
    
    stroke(0);
    displayUpperUpperEyeLid();
    displayUpperEyeLid(0);
    displayLowerEyeLid(0);
  }
  
  private void coverOverflow() {
    for (int i = 1; i < coverEyeBallOverflow; i++) {
      displayUpperEyeLid(-i);
      displayLowerEyeLid(i);
    }
    
    fill(#FFFFFF);
    rect(x-l1-coverEyeBallOverflow, y-boundRadius, coverEyeBallOverflow, 2*boundRadius);
    rect(x+l2, y-boundRadius, coverEyeBallOverflow, 2*boundRadius);
    noFill();
  }
  
  private void displayUpperUpperEyeLid() {
    beginShape();
    curveVertex(x-l1-l0, y+h0-h6);
    curveVertex(x-l1, y+h0-h6);
    curveVertex(x-l1/2, y-h2-h7);
    curveVertex(x+l2/2, y-h3-h8);
    curveVertex(x+l2, y+h1-h9);
    curveVertex(x+l2+l0, y+h1-h9);
    endShape();
  }
  
  private void displayUpperEyeLid(float h) {
    beginShape();
    curveVertex(x-l1-l0, y+h0+h);
    curveVertex(x-l1, y+h0+h);
    curveVertex(x-l1/2, y-h2+h);
    curveVertex(x+l2/2, y-h3+h);
    curveVertex(x+l2, y+h1+h);
    curveVertex(x+l2+l0, y+h1+h);
    endShape();
  }
   
  private void displayLowerEyeLid(float h) {
    beginShape();
    curveVertex(x-l1-l0, y+h0+h);
    curveVertex(x-l1, y+h0+h);
    curveVertex(x-l1/2, y+h4+h);
    curveVertex(x+l2/2, y+h5+h);
    curveVertex(x+l2, y+h1+h);
    curveVertex(x+l2+l0, y+h1+h);
    endShape();
  }
  
  private float[] bounded(float x, float y) {
    float distanceToCenter = sqrt(sq(x-this.x) + sq(y-this.y));
    println(distanceToCenter);
    if (distanceToCenter <= boundRadius) {
      return new float[]{x, y};
    }
    
    return new float[]{this.x+(x-this.x)/distanceToCenter*boundRadius, 
                       this.y+(y-this.y)/distanceToCenter*boundRadius};
  }
}
