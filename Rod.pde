import java.util.ArrayList;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.List;

class Rod{
    float x,y;
    float h,w;
    float blockH;
    int strokeWeight;
    color rodColor;
    List<Blocks> blocks = new CopyOnWriteArrayList<Blocks>();
    
    Rod(float _x, float _y, float _h, int _strokeWeight, color _rodColor){
      x = _x;
      y = _y;
      h = _h*1.25;
      w = _h/2;
      strokeWeight = _strokeWeight;
      rodColor = _rodColor;
    }
    
    void addBlock(Blocks block){
      boolean contains = blocks.contains(block);
      if(contains& blocks.size() >1 ){
        block.x = x - block.w/2;
        block.y = blocks.get(blocks.size() -2).y - blocks.get(blocks.size() -2).h;
      }
      else if (!contains & blocks.size()>0){
        block.x = x - block.w/2;
        block.y = blocks.get(blocks.size() -1).y - blocks.get(blocks.size() -1).h;
      }else {
        block.x = x - block.w/2;
        block.y = y - h/5;
      }
      blocks.add(block);
    }
    
    void removeBlock(int index){
      blocks.remove(index);
      println("remowed");
    }
    
    Blocks getBlock(int index){
      return blocks.get(index);
    }
    
    boolean checkMouseX(){
      return (mouseX < (x+w) & (mouseX > (x-w)));
    }
    boolean checkMouseY(){
      return (mouseY > (y - h) & (mouseY < y));
    }
    void display(){
      stroke(rodColor);
      strokeWeight(strokeWeight);
      line(x,y,x,y-h);
      line(x-w,y,x+w,y);
      
      for (Blocks item : blocks){
      item.display();
      }
    }
}
