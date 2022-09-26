void setup(){
  size(500,500);
}
int [][] go ={ //0: 沒有棋子, 1:黑棋, 2:白棋
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
}; //陣列 array  9x9
int N=0; //目前有幾個棋子
void mousePressed(){
  int j = (mouseX-25)/50; //右手j, 對應x座標
  int i = (mouseY-25)/50; //左手i, 對應y座標
  go[i][j] = (N%2==0) ? 1 : 2 ;  ///if(N%2==) 用1,否則2
  N++;//多了一個棋子
}
void draw(){ //用迴圈,來畫出很多棋
  background(246, 194, 108); //木頭色的棋盤
  for(int i=1; i<=9; i++){ //用迴圈,畫很多條線
    line(50, 50*i, 450, 50*i); //湊出來的
    line(50*i, 50, 50*i, 450); //湊出來的
  }
  for(int i=0; i<9; i++ ){//左手i 對應y座標
    for(int j=0; j<9; j++ ){//右手j 對應x座標
      if( go[i][j]==1){
        fill(0); //1:黑棋,
        ellipse(50+j*50, 50+i*50, 40, 40);
      }else if( go[i][j]==2){
        fill(255); //2:白棋
        ellipse(50+j*50, 50+i*50, 40, 40);
      }
    }
  }
}
