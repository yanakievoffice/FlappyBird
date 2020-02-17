class Button{
  
  PVector location;
  Button(int x, int y){
    location = new PVector(x, y);
  }
  
  void show(){
    rect(location.x, location.y, 80, 40);
    fill(127);
    
    if(overButton()){
      fill(147);
    }
  }
  
  Boolean overButton(){
    if(mouseX >= location.x && mouseX <= location.x + 80 && mouseY >= location.y && mouseY <= location.y + 40){
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
