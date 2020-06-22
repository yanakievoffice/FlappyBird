class MainCharacter {

  PVector location;
  PVector velocity;

  MainCharacter(int x, int y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
  }

  void jump() {
    velocity.y = -10;
  }

  void drag() {
    velocity.y += 0.4;
  }

  void move() {
    location.add(velocity);
  }
  
  Boolean checkCollisions(Boolean dead, Obstacle[] pilars) {
    if (player.location.y>800) {
      dead = true;
    }
    for (int i = 0; i<3; i++) {
      if ((location.x < pilars[i].x + 50 && location.x > pilars[i].x - 50) && (location.y < pilars[i].opening - 100 || location.y > pilars[i].opening + 100)) {
        dead = true;
      }
    }
    
    return dead;
  }

  void show(PImage image) {
    image(image, location.x, location.y, 50, 50);
  }
}
