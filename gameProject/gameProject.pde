Button[] characters = new Button[4];
Button start = new Button(250, 200, 300, 60);
Button exit = new Button(250, 400, 300, 60);
PImage heroKamen;
PImage heroAya;
PImage heroZor;
PImage heroStinkySocks;
PImage character;
Boolean isClicked = false;
Boolean isUndone = false;
Boolean startGame = false;

void setup(){
  size(800, 600);
  background(#4BAFFF);
  heroKamen = loadImage("Kamen.png");
  heroStinkySocks = loadImage("Stinky Socks.png");
  heroZor = loadImage("Zor.png");
  heroAya = loadImage("Aya.png");
  for(int i = 0; i < characters.length; i++){
    characters[i] = new Button(115 + 150*i, 265 + 0*i, 100, 100);
  }
}

void draw(){
  
  for(Button i: characters){
    if(i.clickedButton()){
      background(#4bafff);
      isClicked = true;
      if(characters[0].clickedButton()){
          character = heroKamen;
        }
        
        else if(characters[1].clickedButton()){
          character = heroZor;
        }
        
        else if(characters[2].clickedButton()){
          character = heroAya;
        }
        
        else if(characters[3].clickedButton()){
          character = heroStinkySocks;
        }
    }
    
    if(!isClicked){
      i.show();
      image(heroKamen,125,275,80,80);
      image(heroZor,275,275,80,80);
      image(heroAya,408,260,115,115);
      image(heroStinkySocks,565,270,100,100);
      
      if(isUndone){
        background(#4BAFFF);
        isUndone = false;
      }
     
    }
  }
  
  if(isClicked){
    start.show();
    exit.show();
    text("Start", 300, 250);
  }
  
  if(start.clickedButton()){
    startGame = true;
  }
  
  else if(exit.clickedButton()){
    exit();
  }
  
  if(startGame){
    background(#AAAAAA);
  }
}

void keyPressed(){
  if(key == 'u'){
    isClicked = false;
    isUndone = true;
  }
}
