class Controller {
  private Ball ball;
  private ArrayList blocks;
  
  Controller() {
    ball = new Ball(400, 300);
    
    blocks = new ArrayList();
    blocks.add(new Block(300, 400, 50, 50, 1000, 10));
    blocks.add(new Block(400, 400, 50, 50, 1000, 0));
    blocks.add(new Block(500, 400, 50, 100, 1000, 0));
  }
  
  void run() {
    ball.run();
    if (isContact()) {
      ball.suspend();
    }
    
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i); 
      block.run();
    }
    
    cleanUp();
  }
  
  private void cleanUp() {
    for (int i = blocks.size()-1; i >= 0; i--) {
      Block block = (Block) blocks.get(i);
      if (block.outOfRange()) {
        blocks.remove(i);
      }
    }
  }
  
  boolean isContact() {
    for (int i = 0; i < blocks.size(); i++) {
      Block block = (Block) blocks.get(i);
      if (block.isContact(ball)) {
        return true;
      }
    }
    
    return false;
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
    if (isContact()) {
      ball.hop();
    }
  }
}
