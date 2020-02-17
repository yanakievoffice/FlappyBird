Button startButton; //
Boolean isClicked = false;

void setup(){
  size(800, 600);
  background(#4BAFFF);
  startButton = new Button(360, 280, 80, 40);
}

void draw(){
  if(startButton.clickedButton()){
    background(0);
    isClicked = true;
  }
  
  if(!isClicked){
    startButton.show();
  }
}
