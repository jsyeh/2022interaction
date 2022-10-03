int [][]board={
  { 4, 5, 3, 2, 1, 2, 3, 5, 4},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  { 0, 6, 0, 0, 0, 0, 0, 6, 0},
  { 7, 0, 7, 0, 7, 0, 7, 0, 7},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //上面是黑色
  { 0, 0, 0, 0, 0, 0, 0, 0, 0}, //下面是紅色
  {-7, 0,-7, 0,-7, 0,-7, 0,-7},
  {-0,-6, 0, 0, 0, 0, 0,-6, 0},
  { 0, 0, 0, 0, 0, 0, 0, 0, 0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
}; //1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "傌", "炮", "兵"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
}
void draw() {
  background(#F0B82C);
  for (int x=50; x<=450; x+=50) {
    line( x, 50, x, 250);
    line( x, 300, x, 500);
  }
  //10條
  for (int y=50; y<=500; y+=50) {
    line( 50, y, 450, y);
  }
  for (int i=0; i<10; i++) {
    for (int j=0; j<9; j++) {
      int id = board[i][j]; //1開始
      if (id==0) continue; //陣列請回去(繼續)
      drawChess(50+j*50, 50+i*50, id);
    }
  }
  if(handChess!=0) drawChess(mouseX,mouseY,handChess);
}
void drawChess(int x, int y, int id){
    fill(255);
    ellipse( x, y, 40, 40);
    if(id>0){//黑
      fill(0);
      text( name[id-1], x, y-3);
    }else{//紅
      fill(255,0,0);
      text( name2[-id-1], x, y-3);
    }
}
int handChess=0;
void mousePressed(){
  for(int i=0; i<10; i++){
    for(int j=0; j<9; j++){
      if(dist(mouseX,mouseY,50+j*50,50+i*50)<20){
        handChess = board[i][j];
        board[i][j] = 0;//棋盤上的棋子不見了
      }//把那個棋子,拿在手上
    }
  }
}
void mouseReleased(){    //另一種四捨五入
  int i = (mouseY+25-50)/50;//y是50+i*50
  int j = (mouseX+25-50)/50;//x是50+j*50
  board[i][j] = handChess;//手上的棋子放到棋盤
  handChess = 0; //手上的棋子 清空
}
