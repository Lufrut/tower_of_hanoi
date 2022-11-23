public final float countOfBlocks = 5;

class TowerOfHanoi{
  Rod[] rod;
  Block[] block;
  
  void setup(){
  rod = new Rod[3];
  rod[0] = new Rod(width*0.2,height*0.6,height*0.25, 20, color(1));
  rod[1] = new Rod(width*0.5,height*0.6,height*0.25, 20, color(1));
  rod[2] = new Rod(width*0.8,height*0.6,height*0.25, 20, color(1));
  blocksSetup();
  }
  
  void draw(){
    rodDraw();
  }
  void blocksSetup(){  
      float h = rod[0].h / countOfBlocks;
      float w = rod[0].h ;
      float x = rod[0].x - w/2;
      float y = rod[0].y - h/4;
      color blockColor;
      
      for(int i = 0; i < countOfBlocks; i++){
        blockColor = generateRandomColor();
        y = y - h;
        w = w - w/(countOfBlocks-i+3);
        x = rod[0].x - w/2;
        rod[0].addBlock(
        new Block(x,y,w,h,blockColor)
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
      item.draw();
    }
  }
}
