class Blocks{
  // describe block x,y coordinates w,h sizes
  float x,y;
  float w,h;
  
  color blockColor;
  
  // just constructor 
  Blocks(float _x, float _y, float _w, float _h, color _blockColor){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    blockColor = _blockColor;
  
  }
 
 
  void move(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  // check if mouseX coordinates inside of block or not
  boolean checkMouseX(){
      return (mouseX < (x + w) & (mouseX > (x - w)));
    }
    
    // check if mouseY coordinates inside of block or not
  boolean checkMouseY(){
      return (mouseY > (y - h) & (mouseY < y + h));
    }
    // here we draw the block without borders, with color BlockColor, with dimentions that written in start of class
  void display(){
    stroke(0);
    strokeWeight(0);
    fill(blockColor);
    rect(x,y,w,h);
  }

}
