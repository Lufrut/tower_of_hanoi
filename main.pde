TowerOfHanoi game = new TowerOfHanoi();
void setup(){
  size(1200,800);
  game.setup();
}


void draw(){
  game.display();
}
void mouseDragged(){
  game.mouseDragged();
}
void mouseReleased(){
  game.mouseReleased();
}
