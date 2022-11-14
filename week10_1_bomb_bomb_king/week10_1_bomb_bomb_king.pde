//爆爆王
//Step01 陣列
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
}