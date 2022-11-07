//射擊遊戲: 子彈
//飛機大戰 泡泡龍消消樂 泡泡射手 彈幕的遊戲 猫狗大戰
//Step01: 主角(keyboard)
//Step02: 子彈(自己移動)
//Step02-2: 子彈頭到敵人, 子彈消失, 敵人消失
//Step03: 很多子彈 很多離人
void setup(){
  size(300,300);
}
int userX=150, userY=150, userVX=0, userVY=0;
int []bulletX=new int[10];//可能之後有更多子彈,就大一點
int []bulletY=new int[10];
int []bulletVX=new int[10];
int []bulletVY=new int[10];;
boolean []bulletFlying=new boolean[10];
int bulletN=0;
int enemyX=200, enemyY=80, enemyLife=3;
void draw(){
  println(bulletN);
  background(0);
  if(enemyLife>0){
    fill(0,255,0);
    rect(enemyX, enemyY, 10,10);
  }
  fill(255,255,0);
  ellipse(userX,userY,8,8);
  userX += userVX;
  userY += userVY;
  for(int i=0; i<bulletN; i++){
    if(bulletFlying[i]){
      bulletX[i] += bulletVX[i];
      bulletY[i] += bulletVY[i];
      if( bulletY[i]<0) recycleBullet(i);///當子彈i超過範圍, 回收再利用
      fill(255,0,0);
      ellipse( bulletX[i],bulletY[i], 6,6);
      if( enemyLife>0 && enemyX <= bulletX[i] && bulletX[i] <= enemyX + 8 && enemyY <= bulletY[i] && bulletY[i] <= enemyY + 8){
        bulletFlying[i]=false;
        recycleBullet(i);///當子彈i超過範圍, 回收再利用
        enemyLife--;
      }
    }
  }
}
void recycleBullet(int i){
  for(int k=i; k<10-1; k++){
    bulletX[k] = bulletX[k+1];
    bulletY[k] = bulletY[k+1];
    bulletVX[k] = bulletVX[k+1];
    bulletVY[k] = bulletVY[k+1];
    bulletFlying[k] = bulletFlying[k+1];
  }
  bulletN--;
}
void keyPressed(){
  if(keyCode==RIGHT) userVX=1;
  if(keyCode==LEFT) userVX=-1;
  if(keyCode==UP) userVY=-1;
  if(keyCode==DOWN) userVY=1;
  if(key==' '){
    bulletN++;
    bulletFlying[bulletN-1]=true;
    bulletX[bulletN-1]=userX;
    bulletY[bulletN-1]=userY;
    bulletVY[bulletN-1] = -1;
  }
}
void keyReleased(){
  if(keyCode==RIGHT) userVX=0;
  if(keyCode==LEFT) userVX=0;  
  if(keyCode==UP) userVY=0;
  if(keyCode==DOWN) userVY=0;
}
