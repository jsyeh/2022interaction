//射擊遊戲: 子彈
//飛機大戰 泡泡龍消消樂 泡泡射手 彈幕的遊戲 猫狗大戰
//Step01: 主角(keyboard)
//Step02: 子彈(自己移動)
//Step03: 很多子彈
void setup(){
  size(300,300);
}
int userX=150, userY=150, userVX=0, userVY=0;
void draw(){
  background(0);
  fill(255,255,0);
  ellipse(userX,userY,8,8);
  userX += userVX;
  userY += userVY;
}
void keyPressed(){
  if(keyCode==RIGHT) userVX=1;
  if(keyCode==LEFT) userVX=-1;
  if(keyCode==UP) userVY=-1;
  if(keyCode==DOWN) userVY=1;
}
void keyReleased(){
  if(keyCode==RIGHT) userVX=0;
  if(keyCode==LEFT) userVX=0;  
  if(keyCode==UP) userVY=0;
  if(keyCode==DOWN) userVY=0;
}
