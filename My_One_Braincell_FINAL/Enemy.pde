class Enemy {
  //insert variables
  //character variables
  int tempX;
  int tempY;
  int size;
  int tempWidth;
  int tempHeight;
  int enemyColor;
  int enemyLives;
  //character movement variables
  int moveSpeed;
  //enemy boundary variables
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;
  //character movement booleans
  boolean movingLeft;
  boolean movingRight;
  boolean movingUp;
  boolean movingDown;
  //unalive function
  boolean isDead = false;

  //setup constructor function - assign variables to every class variable
  Enemy(int x, int y, int Width, int Height, color tempColor) {
    tempX = x;
    tempY = y;
    tempWidth = Width;
    tempHeight = Height;
    enemyColor = tempColor;
    enemyLives = 150;
    moveSpeed = 2;
    topBound = tempY;
    bottomBound = tempY + tempHeight;
    leftBound = tempX;
    rightBound = tempX + tempWidth;
  }
  //initalize render function
  void renderEnemy() {
  }
  //initialize moving at player function
  void move(Player p){
    if(p.x >= tempX){
    tempX = tempX + moveSpeed;
    }
    if(p.x <= tempX){
    tempX = tempX - moveSpeed;
    }
    if(p.y >= tempY){
    tempY = tempY + moveSpeed;
    }
    if(p.y <= tempY){
    tempY = tempY - moveSpeed;
    }
    }
 
 //initialize boundaries
  void boundaries(){
    topBound = tempY;
    bottomBound = tempY + tempHeight;
    leftBound = tempX;
    rightBound = tempX + tempWidth;
  }
  //initialize isHit collision detection
  void isHit(Player_Bullet bullet1){
   if(bullet1.rightBound >= leftBound){
   if(bullet1.leftBound <= rightBound){
    if(bullet1.topBound <= bottomBound){
    if(bullet1.bottomBound >= topBound){
    bullet1.isDead = true;
    enemyLives = enemyLives - 1;
    if(enemyLives == 0){
    isDead = true;
    }
         }
         
       }
     }
     
   }
    
  }
  }
