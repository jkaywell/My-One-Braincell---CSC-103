 class Enemy_Bullet{
  //insert variables
  //bullet variables
  int x;
  int y;
  int size;
  int enemybulletColor = color(0,0,0);
  //bullet boundary variables
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  int moveSpeed;
  //movement boolean
  boolean isMoving;
  //unalive boolean
  boolean isDead = false;

   //setup constructor function - assign variables to every class variable
  Enemy_Bullet( int tempX, int tempY, color tempColor) {
    x = tempX;
    y = tempY;
    size = 10;
    moveSpeed = 3;
    topBound = tempY - size/2;
    bottomBound = tempY + size/2;
    leftBound = tempX - size/2;
    rightBound = tempX + size/2;
    enemybulletColor = tempColor;
    
  }
  
  //initalize render function
  void renderEnemyBullet() {
    fill(enemybulletColor);
    circle(x,y,size);
  }
   //initialize shooting at player function
    void move(Player p){
    if(p.x >= x){
    x = x + moveSpeed;
    }
    if(p.x <= x){
    x = x - moveSpeed;
    }
    if(p.y >= y){
    y = y + moveSpeed;
    }
    if(p.y <= y){
    y = y - moveSpeed;
    }
    }

//continuously updates enemy bullet boundaries when moved
void updateBounds(){
      topBound = y - size/2;
    bottomBound = y + size/2;
    leftBound = x- size/2;
    rightBound = x + size/2;
}
  void isHit(Player bullet1){
   if(bullet1.rightBound >= leftBound){
   if(bullet1.leftBound <= rightBound){
   if(bullet1.topBound <= bottomBound){
   if(bullet1.bottomBound >= topBound){
    isDead = true;
        }
   }
   }
   }
  }
  }
