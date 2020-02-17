class Button{
  
  PVector location;
  Button(int x, int y){
    location = new PVector(x, y);
  }
  
  void show(){
    rect(location.x, location.y, 80, 40);
    fill(127);
    
    if(mouseX >= location.x && mouseX <= location.x + 80 && mouseY >= location.y && mouseY <= location.y + 40){
      fill(147);
    }
  }
}
