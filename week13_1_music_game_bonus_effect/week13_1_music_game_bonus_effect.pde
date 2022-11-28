//時間到 or 按鍵得分時, 閃一下
void setup(){
  size(400,400);
}
int BonusT=0;
void draw(){
  background(#FFFFF2);
  fill(0);
  ellipse(100,100,100,100);
  if(BonusT>0){
    fill(255,255,0);
    ellipse(100,100,100+BonusT/2, 100+BonusT/2);
    BonusT-=2;
  }
  textSize(50);
  fill(0);
  text(millis(), 250,300);
}
void keyPressed(){
  if(keyCode==RIGHT) BonusT=60;
}
