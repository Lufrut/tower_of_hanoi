import java.util.ArrayList;

class Rod{
    float x,y;
    float h;
    int strokeWeight;
    color rodColor;
    ArrayList<Block> blocks = new ArrayList<Block>();
    
    Rod(float _x, float _y, float _h, int _strokeWeight, color _rodColor){
      x = _x;
      y = _y;
      h = _h;
      strokeWeight = _strokeWeight;
      rodColor = _rodColor;
    }
    
    void addBlock(Block block){
      blocks.add(block);
    }
    
    void removeBlock(int index){
      blocks.remove(index);
    }
    
    Block getBlock(int index){
      return blocks.get(index);
    }
    
    void draw(){
      stroke(rodColor);
      strokeWeight(strokeWeight);
      line(x,y,x,y-1.25*h);
      line(x-h/2,y,x+h/2,y);
      
      for (Block item : blocks){
      item.draw();
      }
    }
}
