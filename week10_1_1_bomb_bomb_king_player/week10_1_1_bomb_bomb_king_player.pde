//爆爆王
//Step01 陣列
//Step02 Player
int playerJ=0, playerI=2;
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
}
boolean notBlock(int x, int y){
  if(map[playerI+y][playerJ+x]==1) return false;//不可以走
  else return true;//可以走
}
