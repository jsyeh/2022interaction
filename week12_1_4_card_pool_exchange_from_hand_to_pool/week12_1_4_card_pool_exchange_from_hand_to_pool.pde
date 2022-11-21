//任務: 卡牌遊戲,換牌 (4步驟)
//Step01: 原來的牌7張, pool 可放1張牌
//Step02: pool可以秀出來
//Step03: 發1張到pool
//Step04: 如果pool裡面有牌,要把 pool的牌,放上你點的位置
int pool=-1;//沒有牌
int [] myCard={3,1,2,5,4,8,7};
void setup(){
  size(600,300);
  textSize(80);
  textAlign(CENTER,CENTER);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<7; i++){
    if( myCard[i] != -1){
      fill(255); rect( 20+i*80, 40, 70, 100);
      fill(0); text( myCard[i], 20+i*80+35, 70);
    }
  }
  if(pool != -1){
    fill(255); rect( 20+3*80, 180, 70, 100);
    fill(0); text( pool, 20+3*80+35, 210);
  }
}
void mousePressed(){
  for(int i=0; i<7; i++){
    if( 20+i*80 < mouseX && mouseX < 20+i*80+70 && 40 < mouseY && mouseY < 40+100){
      int temp = pool;
      pool = myCard[i];
      myCard[i] = temp;
    }
  }
}
