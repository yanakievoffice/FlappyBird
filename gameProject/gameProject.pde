Button[] characters = new Button[4];
Button start = new Button(100, 200, 300, 60);
Button exit = new Button(100, 400, 300, 60);
MainCharacter player;
Obstacle[] pilars = new Obstacle[3];
PImage heroKamen;
PImage heroAya;
PImage heroZor;
PImage heroStinkySocks;
PImage character;
Boolean isClicked = false;
Boolean dead = false;
Boolean clickedButton = false;
Boolean chosenCharacter = false;
Boolean isUndone = false;
Boolean startGame = false;
int score = 0;

void setup() {
  size(500, 800);
  background(#4BAFFF);
  player = new MainCharacter(250, 400);
  heroKamen = loadImage("Kamen.png");
  heroStinkySocks = loadImage("Stinky Socks.png");
  heroZor = loadImage("Zor.png");
  heroAya = loadImage("Aya.png");
  for (int i = 0; i < characters.length; i++) {
    characters[i] = new Button(20 + 125*i, 265 + 0*i, 100, 100);
  }

  for (int i = 0; i < pilars.length; i++) {
    pilars[i] = new Obstacle(i);
  }
}

void draw() {

  for (Button i : characters) {
    if (!isClicked) {
      i.show();
      image(heroKamen, 30, 275, 80, 80);
      image(heroZor, 155, 275, 80, 80);
      image(heroAya, 263, 260, 115, 115);
      image(heroStinkySocks, 395, 270, 100, 100);

      if (isUndone) {
        background(#4BAFFF);
        isUndone = false;
      }
    }

    if (i.clickedButton()) {
      background(#4bafff);
      isClicked = true;
      if (characters[0].clickedButton() && !chosenCharacter) {
        character = heroKamen;
        chosenCharacter = true;
      } else if (characters[1].clickedButton() && !chosenCharacter) {
        character = heroZor;
        chosenCharacter = true;
      } else if (characters[2].clickedButton() && !chosenCharacter) {
        character = heroAya;
        chosenCharacter = true;
      } else if (characters[3].clickedButton() && !chosenCharacter) {
        character = heroStinkySocks;
        chosenCharacter = true;
      }
    }
  }

  if (isClicked && !clickedButton) {
    start.show();
    exit.show();
    fill(0);
    textAlign(CENTER);
    text("Start", 250, 250);
    textSize(44);
    text("Exit", 250, 450);
  }

  if (start.clickedButton() && !clickedButton) {
    for (int i = 0; i < pilars.length; i++) {
      pilars[i].x += 550;
    }

    startGame = true;
    clickedButton = true;
  } else if (exit.clickedButton() && !clickedButton) {
    exit();
  }

  if (startGame) {
    background(#AAAAAA);
    fill(255);
    rect(400, 0, 100, 50);
    fill(0);
    text(score, 450, 40);
    if (!dead) {
      player.move();
      player.drag();

      for (int i = 0; i < pilars.length; i++) {
        pilars[i].move(score);
        score = pilars[i].score(score);
      }

      player.show(character);

      for (int i = 0; i < pilars.length; i++) {
        pilars[i].locate();
        pilars[i].show();
      }

      dead = player.checkCollisions(dead, pilars);
    }

    if (dead) {
      background(0);
      fill(255);
      textSize(44);
      text("DEAD", 250, 200);
      text("Score: " + score, 250, 400);
      fill(#ff4500);
      textSize(28);
      text("Press 'r' to continue...", 250, 600);
    }
  }
}

void keyPressed() {
  if (key == 'u') {
    isClicked = false;
    isUndone = true;
  }

  if (key == ' ' && !dead) {
    player.jump();
  }

  if (key == 'r' && dead) {
    player.location.y = 400;
    for (int i = 0; i < pilars.length; i++) {
      pilars[i].x += 550;
    }
    
    score = 0;

    dead = false;
  }
}
