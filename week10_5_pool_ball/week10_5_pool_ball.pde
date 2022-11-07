//撞球: 要使用猫狗大戰的Step01射擊方向的旋轉 + Step02碰撞的入射角、反射角
//射擊桌球
void setup(){
  size(600,400);
}
float angle1=0, angle2=-PI;
void draw(){
  background(#218370);
  fill(255);
  rect(50,50, 500,300);
  fill(255,0,0);
  rect(60,60,160-20, 280);
  ellipse(100, 200, 50,50);
  line(100, 200, 100+40*cos(angle1), 200+40*sin(angle1) );
  if(mousePressed && mouseButton==LEFT) angle1 +=0; 
  else angle1+=0.05;
  if(bulletFlying){
    fill(255,80,80);
    ellipse(bulletX,bulletY, 10,10);
    bulletX+=bulletVX;
    bulletY+=bulletVY;
  }
  
  fill(0,255,0);
  rect(540-(160-20),60, 160-20, 280);
  ellipse(500, 200, 50,50);
  line(500, 200, 500+40*cos(angle2), 200+40*sin(angle2) );
  angle2+=0.05;
}
float bulletX, bulletY, bulletVX, bulletVY;
boolean bulletFlying=false;
void mousePressed(){
  if(mouseButton==LEFT){
    bulletX=100;
    bulletY=200;
    bulletVX = cos(angle1);
    bulletVY = sin(angle1);
    bulletFlying=true;
  }
}
