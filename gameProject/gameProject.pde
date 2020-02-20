Button[] characters = new Button[4];
Boolean isClicked = false;
Boolean isUndone = false;

void setup(){
  size(800, 600);
  background(#4BAFFF);
  for(int i = 0; i < characters.length; i++){
    characters[i] = new Button(100 + 100*i, 100 + 100*i, 80, 80);
  }
}

void draw(){
  for(Button i: characters){
    if(i.clickedButton()){
      background(0);
      isClicked = true;
    }
    
    if(!isClicked){
      i.show();
      if(isUndone){
        background(#4BAFFF);
        isUndone = false;
      }
    }
  }
}

void keyPressed(){
  if(key == 'u'){
    isClicked = false;
    isUndone = true;
  }
}
