void setup(){
  size(500,500);
}
float x=250  , y=250;//變數(位置)精細
float vx=2.0 , vy = -1.5 ;
void draw(){
  background(#FFFFF2); //背景,去除殘影
  int boardX = mouseX;
  rect(boardX, 470, 100, 20); //控制的板子
  ellipse( x, y, 10, 10 );//橢圓
  x = x + vx;
  y = y + vy;
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx; 
  if( y>470 && x>boardX && x<boardX+100 ) vy = -vy;
}
