public final float countOfBlocks = 5;
public final int countOfRod = 3;
public final int startRod = 0;
class TowerOfHanoi {
  Rod[] rod;
  Blocks[] block;
  int currentRod = -1;
  int currentBlock = -1;
  float lastBlockX;
  float lastBlockY;
  boolean blockLock = false;
  int lastRod;
  int moveCounter = 0;
  
  void setup() {
    //basic setup rods
    rod = new Rod[countOfRod];
    rod[0] = new Rod(width*0.2, height*0.6, height*0.25, 20, color(1));
    rod[1] = new Rod(width*0.5, height*0.6, height*0.25, 20, color(1));
    rod[2] = new Rod(width*0.8, height*0.6, height*0.25, 20, color(1));
    blocksSetup();
  }

  void display() {
    background(205);
    rodDraw();
    
    drawMoveCount(); //count moves 
    
    //check if on other rod exept start one will be all the block if so then game finish
    for (int i = 0; i < countOfRod; i++) {
      if ((rod[i].blocks.size() == countOfBlocks) & i != startRod) {
        drawWin();
      }
    }
  }
  
  void drawMoveCount() {
    textSize(64);
    text("Moves: " + moveCounter, 900, 100);
  }
  
  void drawWin() {
    background(205);
    textSize(256);
    fill(124, 252, 0);
    text("YOU WON", 100, 200);
  }
  
  // basic setup of blocks with connection to the start rod
  void blocksSetup() {
    float h = rod[startRod].h / (countOfBlocks+1);
    float w = rod[startRod].h ;
    float x = rod[startRod].x - w/2;
    float y = rod[startRod].y - h/4;
    color blockColor;
    
    // generate new blocks each should be less wide than previous 
    for (int i = 0; i < countOfBlocks; i++) {
      blockColor = generateRandomColor();
      w = w - w/(countOfBlocks-i+3);
      rod[0].addBlock(
        new Blocks(x, y, w, h, blockColor)
        );
    }
  }
  
  color generateRandomColor() {
    return color(
      round(random(255)),
      round(random(255)),
      round(random(255))
      );
  }
  
  // draws all the rods in rod array
  void rodDraw() {
    for (Rod item : rod) {
      item.display();
    }
  }
  
  void moveBlocks(int rodFromIndex, int rodToIndex, int blockIndex) {
    
    Blocks block = rod[rodFromIndex].getBlock(blockIndex);
    boolean checkMove = true;

    // check if block more wide than last one, if yes it don't move
    for (Blocks item : rod[rodToIndex].blocks) {
      if (block.w > item.w) {
        checkMove = false;
      }
    }
    // move block and reset all the checks
    if (checkMove) {
      rod[rodToIndex].addBlock(block);
      rod[rodFromIndex].removeBlock(blockIndex);
      currentBlock = -1;
      currentRod = -1;
      lastRod = -1;
      lastBlockX = 0;
      lastBlockY = 0;
      blockLock = true;
      moveCounter++;
    }
  }
  
  void mouseReleased() {
    
    // check if block taken and if it in zone of rod influence if yes it call moveBlocks()
    // main meaning of that to put the block in the rod
    if ((currentBlock>= 0) & (currentRod >=0)) {
      for (int i = 0; i < countOfRod; i++) {
        if (rod[i].checkMouseX() & rod[i].checkMouseY()) {
          moveBlocks(currentRod, i, currentBlock);
        }
      }
    } else {
      // if there is no current block or lasteod it will teleport back a block
      if (currentBlock<0 || lastRod<0 ) {
      } else if (rod[lastRod].blocks.size() > 0 ) {
        rod[lastRod].blocks.get(currentBlock).move(lastBlockX, lastBlockY);
        currentBlock = -1;
        currentRod = -1;
        lastRod = -1;
      }
    }
  }
  
  void mouseDragged() {
    if (mouseButton == LEFT) {
      
      //if there no current rod  we search rod which has been clicked on and set it as current rod 
      if (currentRod<0) {
        for (int i = 0; i < countOfRod; i++) {
          if (rod[i].checkMouseX() & rod[i].checkMouseY()) {
            currentRod = i;
          }
        }
        // then we check if there already exist block in buffer and if the current rod have blocks
      } else if (currentBlock<0 & rod[currentRod].blocks.size() > 0) {
        
        // get last block of the current rod
        int lastBlock = rod[currentRod].blocks.size() - 1;
        
        //check if the block zone of dragging if yes it make last rod current rod and last block current block then it disable blockLock and you can move block
        if (rod[currentRod].blocks.get(lastBlock).checkMouseX()
          & rod[currentRod].blocks.get(lastBlock).checkMouseY()
          ) {
          lastBlockX = rod[currentRod].blocks.get(lastBlock).x;
          lastBlockY = rod[currentRod].blocks.get(lastBlock).y;
          lastRod = currentRod;
          currentBlock = lastBlock;
          blockLock = false;
        }
      } else if (rod[currentRod].blocks.size() > 0 & !blockLock) {
        rod[currentRod].blocks.get(currentBlock).move(mouseX, mouseY);
      }
    }
  }
}
