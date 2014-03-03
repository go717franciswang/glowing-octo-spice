class Controller {
  private Ball ball;
  private ArrayList blocks;
  private Block lastBlock;
  private int zstart = -3000;
  
  Controller() {
    ball = new Ball(400, 300);
    
    blocks = new ArrayList();
    Block b = new Block(400, 400, -350, 100, 20, 1000-zstart, 20);
    lastBlock = b;
    blocks.add(b);
  }
  
  public void run() {
    ball.run();
    if (isContact()) {
      ball.suspend();
    }
    
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i); 
      block.run();
    }
    
    cleanUp();
    genBlock();
    gameOver();
  }
  
  private void gameOver() {
    if 
  }
  
  private void genBlock() {
    if (lastBlock.z() - zstart > 1000) {
      while (true) {
        Block b = getRandomBlock();
        blocks.add(b);
        if (lastBlock.distanceTo(b) < 100 && random(1) < 0.66) {
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
    return new Block(x, 400, zstart, w, h, l, 20);
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
