//declare class Raindrop
class Raindrop {
//declare raindrop variables
int xPos;
int yPos;
int Length;
int ySpeed;
PImage img;

//setup constructor function
Raindrop(PImage tempImage){
  xPos = int(random(0,width));
  yPos = int(random(0, width));
  Length = int(random(10,30));
  ySpeed = int(random(5,10));
  img = tempImage;  
}

//initialize render function
void render(){
  strokeWeight(5);
  stroke(img.get(xPos,yPos));
  line(xPos,yPos,xPos,yPos + Length);
}

//initialize move function
void move(){
yPos = ySpeed + yPos;
}
//initialize reset function
void reset(){
if(yPos > height){
yPos = 0;
  }
 }
}
