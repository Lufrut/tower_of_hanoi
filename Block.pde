class Block{
  float x,y;
  float w,h;
  
  color blockColor;
  
  Block(float _x, float _y, float _w, float _h, color _blockColor){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    blockColor = _blockColor;
  
  }
  
  void draw(){
    stroke(0);
    strokeWeight(0);
    fill(blockColor);
    rect(x,y,w,h);
  }

}
