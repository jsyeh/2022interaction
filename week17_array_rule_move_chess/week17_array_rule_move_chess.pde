//用象棋做例子
void setup(){
  size(700,400);
}
void draw(){
  background(#FFFFF2);
  drawLines();
}
int knightI=1, knightJ=2;
void drawLines(){
  noFill();
  for(int i=0; i<4; i++){
    for(int j=0; j<8; j++){
      rect(j*75+50, i*75+50, 75,75);
    }
  }
  fill(255);
  drawChess(knightI, knightJ);//ellipse(knightJ*75+50, knightI*75+50, 60,60);
  for(int i=0; i<8; i++){
    int ii=knightI+moveY[i], jj=knightJ+moveX[i];
    if(ii<0 || jj<0 || ii>=4 || jj>=8) continue;
    drawChess(ii, jj);
  }
}
int [][] move ={
  {1, -2},
  {1,  2},
  {2, -1},
  {2,  1},
  {-1, 2},
  {-1,-2},
  {-2, 1},
  {-2,-1}
};
int [] moveX = { 1, 1, 2, 2,-1,-1,-2,-2};
int [] moveY = {-2, 2,-1, 1, 2,-2, 1,-1};
void drawChess(int i, int j){
  fill(255);
  ellipse(j*75+50, i*75+50, 60,60);  
}
void keyPressed(){
  if(keyCode==RIGHT) knightJ++;
  if(keyCode==LEFT) knightJ--;
  if(keyCode==UP) knightI--;
  if(keyCode==DOWN) knightI++;
}
