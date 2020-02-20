Button[] characters = new Button[4];
PImage heroKamen;
PImage heroAya;
PImage heroZor;
PImage heroStinkySocks;
Boolean isClicked = false;
Boolean isUndone = false;

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
      background(0);
      isClicked = true;
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
}

void keyPressed(){
  if(key == 'u'){
    isClicked = false;
    isUndone = true;
  }
}
