import java.util.ArrayList;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.List;

class Rod{
    float x,y;
    float h,w;
    
    // height of the blocks in road
    
    float blockH;
    
    int strokeWeight;
    color rodColor;
    
    // list of blocks that connected to the rod
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
      
      //there described some checks that check size of the block in 1 check and other checks that fix array out of border exeption
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
    }
    
    Blocks getBlock(int index){
      return blocks.get(index);
    }
    // checks that check if the mouse coordinates inside of rod click zone
    boolean checkMouseX(){
      return (mouseX < (x+w) & (mouseX > (x-w)));
    }
    boolean checkMouseY(){
      return (mouseY > (y - h) & (mouseY < y));
    }
    
    // draw rod with settings that described in fields 
    void display(){
      stroke(rodColor);
      strokeWeight(strokeWeight);
      line(x,y,x,y-h);
      line(x-w,y,x+w,y);
      // for each element in blocks array we draw this block 
      
      for (Blocks item : blocks){
      item.display();
      }
    }
}
