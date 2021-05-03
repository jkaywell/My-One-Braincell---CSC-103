//classes must interact with each instance
//exs. attact function, collision function, shoot function
//An object (individual) of a class can be an input

//import sound library
import processing.sound.*;

//declare a variable to store the sound
SoundFile backgroundSong1;
SoundFile backgroundSong2;
SoundFile backgroundSong3;
SoundFile startSound;
SoundFile loseSound;
SoundFile endSound;


//global variables initialization
int a;
int b;
PImage start;
PImage firstStage;
PImage secondStage;
PImage thirdStage;
PImage lose;
PImage end;
Player player1;
Player_Bullet bullet1;
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
ArrayList<Enemy> enemyList1;
ArrayList<Enemy> enemyList2;
ArrayList<Enemy> enemyList3;
ArrayList<Enemy_Bullet> enemyBulletList;
Animation animation_braincell;
Animation animation_braincell_projectiles;
Animation animation_first_enemy;
Animation animation_second_enemy;
Animation animation_third_enemy;
ArrayList<Player_Bullet> playerBulletList;
PImage [] braincell_images = new PImage [7];
PImage [] braincell_projectile_images = new PImage [10];
PImage [] first_enemy_images = new PImage [4];
PImage [] second_enemy_images = new PImage [5];
PImage [] third_enemy_images = new PImage [7];
int switchVal;
//set global variables
PImage psychedelic;
float x;
float y;
int loc;

//initialize raindrop array
Raindrop[] raindrop = new Raindrop[600];


void setup() {
  size(1200, 800);
  //introducing assets
  start = loadImage("start.png");
  firstStage = loadImage("flag.png");
  secondStage = loadImage("psychedelic.png");
  thirdStage = loadImage("shape_art.png");
  lose = loadImage("lose.png");
  end = loadImage("end.png");
  //setting up assets
  player1 = new Player (color(13,77,0));
  enemyList1 = new ArrayList<Enemy>();
  enemyList2 = new ArrayList<Enemy>();
  enemyList3 = new ArrayList<Enemy>();
  playerBulletList = new ArrayList<Player_Bullet>();
  enemyBulletList = new ArrayList<Enemy_Bullet>();
  enemy1 = new Enemy (300, 225, 75, 75, color(230,0,0));
  enemyList1.add(enemy1);
  enemy2 = new Enemy (300, 225, 75, 75, color(230,0,0));
  enemyList2.add(enemy2);
  enemy3 = new Enemy (300, 225, 75, 75, color(230,0,0));
  enemyList3.add(enemy3);
  //background sound functions
  backgroundSong1 = new SoundFile(this, "battotai_drip.wav");
  backgroundSong1.amp(0.25);
  backgroundSong1.rate(1.35);
   //background sound functions
  backgroundSong2 = new SoundFile(this, "robot_outro.wav");
  backgroundSong2.amp(0.25);
  backgroundSong2.rate(1.0);
     //background sound functions
  backgroundSong3 = new SoundFile(this, "hungarian_dance.wav");
  backgroundSong3.amp(0.25);
  backgroundSong3.rate(1.0);
    //start sound functions
  startSound = new SoundFile(this, "start_sound.wav");
  startSound.amp(1.0);
  startSound.rate(1.0);
      //lose sound functions
  loseSound = new SoundFile(this, "lose_sound.wav");
  loseSound.amp(1.0);
  loseSound.rate(1.0);
      //end sound functions
  endSound = new SoundFile(this, "end_sound.wav");
  endSound.amp(1.0);
  endSound.rate(1.0);
  //initializing player .png files for animation
for(int i=0;i<braincell_images.length;i++){
  braincell_images[i] = loadImage("braincell_"+i+".png");
}
animation_braincell = new Animation(braincell_images,0.1,3);

//initializing projectile .png files for animation
for(int i=0;i<braincell_projectile_images.length;i++){
  braincell_projectile_images[i] = loadImage("braincell_projectile_"+i+".png");
}
animation_braincell_projectiles = new Animation(braincell_projectile_images,0.1,1.5);
{
  //initializing first_enemy .png files for animation
for(int i=0;i<first_enemy_images.length;i++){
  first_enemy_images[i] = loadImage("first_enemy_"+i+".png");
}
animation_first_enemy = new Animation(first_enemy_images,0.1,4.5);

  //initializing second_enemy .png files for animation
for(int i=0;i<second_enemy_images.length;i++){
  second_enemy_images[i] = loadImage("second_enemy_"+i+".png");
}
animation_second_enemy = new Animation(second_enemy_images,0.1,4.5);

  //initializing third_enemy .png files for animation
for(int i=0;i<third_enemy_images.length;i++){
  third_enemy_images[i] = loadImage("third_enemy_"+i+".png");
}
animation_third_enemy = new Animation(third_enemy_images,0.1,4.5);

{

//raindrop effect for stage 2
for(int i = 0; i < raindrop.length; i++){
  raindrop [i] = new Raindrop(secondStage);}
}
}

}


void draw() {
   switch(switchVal) {
    //starting screen
  case 0:
    background(start);
  //always plays the song. If it ends, it starts back up
  if(!startSound.isPlaying()){
  startSound.play();
  }
    break;
    //normal gameplay
    case 1:
  background(firstStage);
  startSound.stop();
  //player bullet for loop
  for (Player_Bullet bullet1 : playerBulletList) {
    bullet1.renderPlayerBullet();
    bullet1.move();
    bullet1.updateBounds();

  }
  //controls player action when isDead == false
  if(player1.isDead == false){
  player1.renderPlayer();
  player1.updateBounds();
  player1.move();
    //render animations
  animation_braincell.display(player1.x,player1.y);
  }
    //always plays the song. If it ends, it starts back up
  if(!backgroundSong1.isPlaying()){
  backgroundSong1.play();
  }
    //enemy for loop
  for (Enemy enemy1 : enemyList1){
  enemy1.renderEnemy();
  enemy1.boundaries();
  enemy1.move(player1);
  //render animations
  animation_first_enemy.display(enemy1.tempX,enemy1.tempY);
  animation_first_enemy.isAnimating = true;
  }
  
   //recognizes enemy as being hit by player bullet
   for (Player_Bullet bullet1 : playerBulletList) {
    for (Enemy enemy1 : enemyList1) {
      enemy1.isHit(bullet1);
    }
    }
    //enemy bullet for loop
    for (Enemy_Bullet bullet1 : enemyBulletList) {
    bullet1.renderEnemyBullet();
    bullet1.move(player1);
    bullet1.updateBounds();
    player1.isHit(bullet1);
  }

    //removes enemy when hit
    for (int p = enemyList1.size()-1; p>=0; p--) {
     if (enemyList1.get(p).isDead == true) {
    enemyList1.remove(p);
    }
}
    //removes fired enemy bullets
    for (int p = enemyBulletList.size()-1; p>=0; p--) {
     if (enemyBulletList.get(p).isDead == true) {
    enemyBulletList.remove(p);
    println("detect hit");
    }
}
      //fuction to add a bullet
  if (random(1000) < 5){
    enemyBulletList.add(new Enemy_Bullet(enemy1.tempX, enemy1.tempY, color(0,0,0)));
  }
  
  if(player1.isDead == true){
  background(lose);
  backgroundSong1.stop();
  //always plays the song. If it ends, it starts back up
  if(!loseSound.isPlaying()){
  loseSound.play();
  }
  }
  
  if(enemy1.isDead == true){
    switchVal = 2;
  }
  break;
  case 2:
  background(0,0,0);
  backgroundSong1.stop();
      //for loop to initialize functions from raindrop class
  for(int i = 0; i < raindrop.length; i++){
    raindrop[i].render();
    raindrop[i].move();
    raindrop[i].reset();
  }
    //player bullet for loop
  for (Player_Bullet bullet1 : playerBulletList) {
    bullet1.renderPlayerBullet();
    bullet1.move();
    bullet1.updateBounds();

  }
  //controls player action when isDead == false
  if(player1.isDead == false){
  player1.renderPlayer();
  player1.updateBounds();
  player1.move();
    //render animations
  animation_braincell.display(player1.x,player1.y);
  }
    //always plays the song. If it ends, it starts back up
  if(!backgroundSong2.isPlaying()){
  backgroundSong2.play();
  }
    //enemy for loop
  for (Enemy enemy2 : enemyList2){
  enemy2.renderEnemy();
  enemy2.boundaries();
  enemy2.move(player1);
    //render animations
  animation_second_enemy.display(enemy2.tempX,enemy2.tempY);
  animation_second_enemy.isAnimating = true;
  }
  
   //recognizes enemy as being hit by player bullet
   for (Player_Bullet bullet1 : playerBulletList) {
    for (Enemy enemy2 : enemyList2) {
      enemy2.isHit(bullet1);
    }
    }
    //enemy bullet for loop
    for (Enemy_Bullet bullet1 : enemyBulletList) {
    bullet1.renderEnemyBullet();
    bullet1.move(player1);
    bullet1.updateBounds();
    player1.isHit(bullet1);
  }

    //removes enemy when hit
    for (int p = enemyList2.size()-1; p>=0; p--) {
     if (enemyList2.get(p).isDead == true) {
    enemyList2.remove(p);
    }
}
    //removes fired enemy bullets
    for (int p = enemyBulletList.size()-1; p>=0; p--) {
     if (enemyBulletList.get(p).isDead == true) {
    enemyBulletList.remove(p);
    println("detect hit");
    }
}
      //fuction to add a bullet
  if (random(1000) < 5){
    enemyBulletList.add(new Enemy_Bullet(enemy2.tempX, enemy2.tempY, color(0,0,0)));
  }
  
    if(player1.isDead == true){
  background(lose);
  backgroundSong2.stop();
      //always plays the song. If it ends, it starts back up
  if(!loseSound.isPlaying()){
  loseSound.play();
  }
  }
  
  if(enemy2.isDead == true){
    switchVal = 3;
  }
  break;
  case 3:
  background(thirdStage);
  fill(0,0,0);
  backgroundSong2.stop();
     
    //player bullet for loop
  for (Player_Bullet bullet1 : playerBulletList) {
    bullet1.renderPlayerBullet();
    bullet1.move();
    bullet1.updateBounds();

  }
  //controls player action when isDead == false
  if(player1.isDead == false){
  player1.renderPlayer();
  player1.updateBounds();
  player1.move();
    //render animations
  animation_braincell.display(player1.x,player1.y);
  }
    //always plays the song. If it ends, it starts back up
  if(!backgroundSong3.isPlaying()){
  backgroundSong3.play();
  }
    //enemy for loop
  for (Enemy enemy3 : enemyList3){
  enemy3.renderEnemy();
  enemy3.boundaries();
  enemy3.move(player1);
    //render animations
  animation_third_enemy.display(enemy3.tempX,enemy3.tempY);
  animation_third_enemy.isAnimating = true;
  }
  
   //recognizes enemy as being hit by player bullet
   for (Player_Bullet bullet1 : playerBulletList) {
    for (Enemy enemy3 : enemyList3) {
      enemy3.isHit(bullet1);
    }
    }
    //enemy bullet for loop
    for (Enemy_Bullet bullet1 : enemyBulletList) {
    bullet1.renderEnemyBullet();
    bullet1.move(player1);
    bullet1.updateBounds();
    player1.isHit(bullet1);
  }

    //removes enemy when hit
    for (int p = enemyList3.size()-1; p>=0; p--) {
     if (enemyList3.get(p).isDead == true) {
    enemyList3.remove(p);
    }
}
    //removes fired enemy bullets
    for (int p = enemyBulletList.size()-1; p>=0; p--) {
     if (enemyBulletList.get(p).isDead == true) {
    enemyBulletList.remove(p);
    println("detect hit");
    }
}
      //fuction to add a bullet
  if (random(1000) < 5){
    enemyBulletList.add(new Enemy_Bullet(enemy3.tempX, enemy3.tempY, color(0,0,0)));
  }
  
    if(player1.isDead == true){
  background(lose);
  backgroundSong3.stop();

      //always plays the song. If it ends, it starts back up
  if(!loseSound.isPlaying()){
  loseSound.play();
  }
  }
  
    if(enemy3.isDead == true){
    switchVal = 4;
  }
  break;
  case 4:
  background(end);
  backgroundSong3.stop();
      //always plays the song. If it ends, it starts back up
  if(!endSound.isPlaying()){
  endSound.play();
  }
  break;
    }
    
}



void keyPressed() {
  //if the key code is left
  if (key == 'a') {
    player1.movingLeft = true;
  }
  if(player1.movingLeft == true){
  animation_braincell.isAnimating = true;
  }
  //if the key code is right
  if (key == 'd') {
    player1.movingRight = true;
  }
  if(player1.movingRight == true){
  animation_braincell.isAnimating = true;
  }
  //if the key code is up
  if (key == 'w') {
    player1.movingUp = true;
  }
  if(player1.movingUp == true){
  animation_braincell.isAnimating = true;
  }
  //if the key code is down
  if (key == 's') {
    player1.movingDown = true;
  }
  if(player1.movingDown == true){
  animation_braincell.isAnimating = true;
  }

    //fuction to add a bullet
  if (key==' ') {
    playerBulletList.add(new Player_Bullet(player1.x+25, player1.y+25, animation_braincell_projectiles));
    animation_braincell_projectiles.isAnimating = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    player1.movingLeft = false;
  }
  if (key == 'd') {
    player1.movingRight = false;
  }

  if (key == 'w') {
    player1.movingUp = false;
  }
    if (key == 's') {
    player1.movingDown = false;
  }
  
    if (key=='r') {
    switchVal = 1;
  }
}
