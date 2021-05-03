  class Player_Bullet{
  //insert variables
  //bullet variables
  int x;
  int y;
  int size;
  int playerbulletColor = color(255,255,255);
  Animation braincell_projectile;
  //bullet boundary variables
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  //movement booleam
  boolean isMoving;
  //unalive boolean
  boolean isDead = false;

   //setup constructor function - assign variables to every class variable
  Player_Bullet( int tempX, int tempY, Animation tempAnimation) {
    x = tempX;
    y = tempY;
    size = 10;
    braincell_projectile = tempAnimation;
    topBound = tempY - size/2;
    bottomBound = tempY + size/2;
    leftBound = tempX - size/2;
    rightBound = tempX + size/2;
    
  }
  
  //initalize render function
  void renderPlayerBullet() {
  braincell_projectile.display(x,y);
  }
  //initialize movement speed/function
void move(){
  x = x + 50;
  }
//continuously updates player bullet boundaries when moved
void updateBounds(){
      topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x- size/2;
    rightBound = x + size/2;
  
}
}
