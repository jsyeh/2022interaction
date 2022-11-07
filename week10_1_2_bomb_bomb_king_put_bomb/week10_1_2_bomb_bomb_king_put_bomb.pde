//爆爆王
//Step01 陣列
//Step02 Player
//Step03 放炸彈 map[i][j]==-1
//Step04 炸彈爆炸的範圍特效, 之後再解決
int playerJ=0, playerI=2;
int [][] bombT = new int[8][11];//0:沒有, 倒數計時
int [][] map = {
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},
  {0,1,0,1,0,1,0,1,0,1,0}, //1: 房子
  {0,0,0,0,0,0,0,0,0,0,0},  
  {0,0,0,0,0,0,0,0,0,0,0},
};
void setup(){
  size( 550, 400);
}
void draw(){
  background(#C7FA23);
  for(int i=0; i<8; i++){
    for(int j=0; j<11; j++){
      if(map[i][j]==1){
        fill(#E58B02);
        rect(j*50, i*50, 50, 50);
      }else if(map[i][j]==-1){
        fill(255,0,0);//炸彈
        rect(j*50, i*50, 50, 50);
        if(bombT[i][j]>0) bombT[i][j]--;
        else{ //時間到,就炸
          map[i][j]=0;
        }
      }else{
        noFill();
        rect(j*50, i*50, 50, 50);
      }
    }
  }
  fill(255);
  int playerX=playerJ*50+25;
  int playerY=playerI*50+25;
  ellipse(playerX, playerY, 50,50);
}
void keyPressed(){
  if(keyCode==RIGHT && notBlock(1,0) ) playerJ++;
  if(keyCode==LEFT && notBlock(-1,0) ) playerJ--;
  if(keyCode==DOWN && notBlock(0,1) ) playerI++;
  if(keyCode==UP && notBlock(0,-1) ) playerI--;
  if(key==' ') {
    map[playerI][playerJ]=-1;//炸彈
    bombT[playerI][playerJ]=60;//等60frame,1秒
  }
}
boolean notBlock(int x, int y){
  if(playerI+y<0 || playerI+y>=8) return false;//超過界線
  if(playerJ+x<0 || playerJ+x>=11) return false;//超過界線
  if(map[playerI+y][playerJ+x]==1) return false;//不可以走
  else return true;//可以走
}
