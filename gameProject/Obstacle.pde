class Obstacle{
  float x;
  float opening;
  int i = 0;
  Boolean passed = false;
  Boolean moved = false;
  
  Obstacle(int i){
    x = 200 * i + 250;
    opening = random(600) + 100;
  }
  
  void locate(){
    if(x < 0){
      x += 600;
      opening = random(600) + 100;
      passed = false;
    }
  }
  
  int score(int score){
    if(x < 250 && !passed){
      score++;
      passed = true;
      moved = true;
    }
    
    return score;
  }
  
  void move(int score){
    x -= 3 + i;
    
    if(score % 5 == 0 && score != 0 && moved){
      i++;
      moved = false;
    }
  }
  
  void show(){
    rect(x, 0, 30, opening - 100);
    rect(x, opening + 100, 30, 800 - opening - 100);
  }
}
