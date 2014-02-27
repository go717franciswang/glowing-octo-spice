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
