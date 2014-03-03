class Controller {
  private Ball ball;
  private ArrayList blocks;
  private Block lastBlock;
  private int zstart = -3000;
  private int startTime;
  private int score = 0;
  private int speed;
  private int initialSpeed = 15;
  private int topSpeed = 50;
  private int iterations = 0;
  
  private int gameState;
  private final int GAMEON = 1;
  private final int GAMEOVER = 2;
  
  private AudioSample player;
  
  Controller(Minim minim) {
    player = minim.loadSample("flyby-Conor-1500306612.mp3", 512);
    
    gameState = GAMEON;
    speed = initialSpeed;
    ball = new Ball(400, 200);
    
    blocks = new ArrayList();
    Block b = new Block(400, 400, -350, 100, 20, 3000-zstart, 20);
    lastBlock = b;
    blocks.add(b);
  }
  
  private void cleanUp() {
    for (int i = blocks.size()-1; i >= 0; i--) {
      Block block = (Block) blocks.get(i);
      if (block.outOfRange()) {
        blocks.remove(i);
        if (gameState == GAMEON) {
          player.trigger();
        }
      }
    }
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
  
  private void incrementScore() {
    if (gameState == GAMEON) {
      iterations ++;
      score += speed;
    }
  }
  
  private void displayScore() {
    textAlign(CENTER);
    switch (gameState) {
      case GAMEON:
        text("Score: " + score + ", speed: " + speed, width/2, 100);
        break;
      case GAMEOVER:
        text("Score: " + score + ", speed: " + speed + "\nGame Over", width/2, 100);
        break;
    }
  }
  
  private void accelerate() {
    speed = round(initialSpeed + (topSpeed-initialSpeed)/(1+exp(-(iterations-700)/200)));
  }
  
  private void gameOver() {
    if (ball.outOfRange()) {
      gameState = GAMEOVER;
    }
  }
  
  private void genBlock() {
    if (lastBlock.getz() - zstart > 1000) {
      while (true) {
        Block b = getRandomBlock();
        blocks.add(b);
        if (lastBlock.distanceTo(b) < speed*5 && random(1) < 0.8) {
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
