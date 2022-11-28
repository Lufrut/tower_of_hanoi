class Blocks{
  float x,y;
  float w,h;
  
  color blockColor;
  
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
  boolean checkMouseX(){
      return (mouseX < (x + w) & (mouseX > (x - w)));
    }
  boolean checkMouseY(){
      return (mouseY > (y - h) & (mouseY < y + h));
    }
  void display(){
    stroke(0);
    strokeWeight(0);
    fill(blockColor);
    rect(x,y,w,h);
  }

}
