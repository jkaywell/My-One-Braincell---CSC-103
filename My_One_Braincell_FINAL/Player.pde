class Player{
  //insert variables
  //character variables
  int x;
  int y;
  int size;
  int playerColor;
  //character movement variables
  int moveSpeed;
  int jumpSpeed;
  int fallSpeed;
  //character boundary variables
  int topBound = 0;
  int bottomBound = 350;
  int leftBound= 0;
  int rightBound = 550;
  int playerLives;
  //character movement booleans
  boolean movingLeft;
  boolean movingRight;
  boolean movingUp;
  boolean movingDown;
  //unalive function
  boolean isDead = false;


   //setup constructor function - assign variables to every class variable
  Player( color tempColor) {
    x = 100;
    y = 350;
    size = 50;
    moveSpeed = 15;
    playerLives = 3;
    playerColor = tempColor;
    
  }

//initalize render function
  void renderPlayer(){
   }

//initialize move function
//all directions are self-contained
void move(){
  left();
  right();
  up();
  down();
}

void left(){
  if(movingLeft){
  if(x >= leftBound){
  x = x-5;
   }
  }
}

void right(){
  if(movingRight){
  if(x <= rightBound){
 x = x+5;
   }
  }
}

void up(){
  if(movingUp){
  if(x >= topBound){
 y = y-5;
   }
  }
}

void down(){
  if(movingDown){
  if(x <= bottomBound){
 y = y+5;
   }
  }
}

//continuously updates player boundaries when moved
void updateBounds(){
    topBound = y;
    bottomBound = y + size;
    leftBound = x;
    rightBound = x + size;
}

   //initialize isHit collision detection
  void isHit(Enemy_Bullet bullet1){
   if(bullet1.rightBound >= leftBound){
   if(bullet1.leftBound <= rightBound){
   if(bullet1.topBound <= bottomBound){
   if(bullet1.bottomBound >= topBound){
    bullet1.isDead = true;
    playerLives = playerLives - 1;
    if(playerLives == 0){
    isDead = true;
    }
    }
   }
   }
   }
}
}
