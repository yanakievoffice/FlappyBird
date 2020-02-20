class Button{
  
  PVector location;
  PVector size;
  
  Button(int x, int y, int width, int height){
    location = new PVector(x, y);
    size = new PVector(width, height);
  }
  
  void show(){
    fill(127);
    
    if(overButton()){
      fill(147);
    }
    
    rect(location.x, location.y, size.x, size.y);
  }
  
  Boolean overButton(){
    if(mouseX >= location.x && mouseX <= location.x + size.x && mouseY >= location.y && mouseY <= location.y + size.y){
      return true;
    }
    return false;
  }
  
  Boolean clickedButton(){
    if(overButton()){
      if(mousePressed){
        return true;
      }
    }
    return false;
  }
}
