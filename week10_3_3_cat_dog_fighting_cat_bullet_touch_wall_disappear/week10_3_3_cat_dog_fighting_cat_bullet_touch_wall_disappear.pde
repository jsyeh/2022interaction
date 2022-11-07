///猫狗大戰
void setup(){
  size(600,300);
}
int catX=150, catY=250;
int dogX=450, dogY=250;
float angle1=0, angle2=0;
boolean bulletFlying1=false;
float bulletX1, bulletY1;
float bulletVX1, bulletVY1;
void draw(){
  background(#FFFFF2);
  ellipse(catX,catY, 80,80);
  line(catX,catY, catX+80*cos(angle1), catY+80*sin(angle1) );
  ellipse(dogX,dogY, 80,80);
  rect(300,150, 10,300);//牆
  if(bulletFlying1){
    bulletX1 += bulletVX1;
    bulletY1 += bulletVY1;
    bulletVY1 += 0.98;
    ellipse(bulletX1, bulletY1, 30,30);
    if( 300-15 < bulletX1 && bulletX1 < 300+15 && 150-15 < bulletY1 && bulletY1 < 300 ){
      bulletFlying1=false;
    }
  }
}
void keyPressed(){
  if(keyCode==UP) angle1+=0.1;
  if(keyCode==DOWN) angle1-=0.1;
  if(key==' '){
    bulletFlying1=true;
    bulletX1=catX;
    bulletY1=catY;
    bulletVX1=cos(angle1)*20;
    bulletVY1=sin(angle1)*20;
  }
}
