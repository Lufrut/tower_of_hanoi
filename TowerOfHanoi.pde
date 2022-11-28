public final float countOfBlocks = 5;
public final int countOfRod = 3;
class TowerOfHanoi{
  Rod[] rod;
  Blocks[] block;
  int currentRod = -1;
  int currentBlock = -1;
  float lastBlockX;
  float lastBlockY;
  boolean blockLock = false;
  int lastRod;
  void setup(){
  rod = new Rod[countOfRod];
  rod[0] = new Rod(width*0.2,height*0.6,height*0.25, 20, color(1));
  rod[1] = new Rod(width*0.5,height*0.6,height*0.25, 20, color(1));
  rod[2] = new Rod(width*0.8,height*0.6,height*0.25, 20, color(1));
  blocksSetup();
  }
  
  void display(){
    background(205);
    rodDraw();
  }
  void blocksSetup(){  
      float h = rod[0].h / (countOfBlocks+1);
      float w = rod[0].h ;
      float x = rod[0].x - w/2;
      float y = rod[0].y - h/4;
      color blockColor;
      
      for(int i = 0; i < countOfBlocks; i++){
        blockColor = generateRandomColor();
       // y = y - h;
        w = w - w/(countOfBlocks-i+3);
        //x = rod[0].x - w/2;
        rod[0].addBlock(
        new Blocks(x,y,w,h,blockColor)
        );
      }
      
  }
  color generateRandomColor(){
   return color(
   round(random(255)),
   round(random(255)),
   round(random(255))
   );
  }
  void rodDraw(){
    for(Rod item : rod){
      item.display();
    }
  }
  
  void moveBlocks(int rodFromIndex, int rodToIndex, int blockIndex){
     
    Blocks block = rod[rodFromIndex].getBlock(blockIndex);
    boolean checkMove = true;
    
    for(Blocks item : rod[rodToIndex].blocks){
      if(block.w > item.w){
        checkMove = false;
      } 
    }
     if(checkMove){
        rod[rodToIndex].addBlock(block);
        rod[rodFromIndex].removeBlock(blockIndex);
        currentBlock = -1;
          currentRod = -1;
          lastRod = -1;
          lastBlockX = 0;
          lastBlockY = 0;
          blockLock = true;
      }
  }
  void mouseReleased(){
    if((currentBlock>= 0) & (currentRod >=0)){
      for(int i = 0; i < countOfRod; i++){
        if(rod[i].checkMouseX() & rod[i].checkMouseY()){
          //print(i);
          moveBlocks(currentRod, i, currentBlock);
          return;
        }
      }
      
    } else{
    if (currentBlock<0 || lastRod<0 ){}
      else if(rod[lastRod].blocks.size() > 0 ){
        rod[lastRod].blocks.get(currentBlock).move(lastBlockX, lastBlockY);
        currentBlock = -1;
        currentRod = -1;
        lastRod = -1;
      }
    }
    
  }
  void mouseDragged(){
    if (mouseButton == LEFT) {
      if(currentRod<0){
        for(int i = 0; i < countOfRod; i++){
          if(rod[i].checkMouseX() & rod[i].checkMouseY()){
            currentRod = i;
          }
        }
      }
      else if(currentBlock<0 & rod[currentRod].blocks.size() > 0){
        int lastBlock = rod[currentRod].blocks.size() - 1;
        if(rod[currentRod].blocks.get(lastBlock).checkMouseX()
        & rod[currentRod].blocks.get(lastBlock).checkMouseY()
        ){
          lastBlockX = rod[currentRod].blocks.get(lastBlock).x;
          lastBlockY = rod[currentRod].blocks.get(lastBlock).y;
          lastRod = currentRod;
          currentBlock = lastBlock;  
          blockLock = false;
        }
      } else if (rod[currentRod].blocks.size() > 0 & !blockLock){
        rod[currentRod].blocks.get(currentBlock).move(mouseX, mouseY);
      }
    }
  }
}
