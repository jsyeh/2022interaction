void setup(){
  size(500,500);
}
float x=250  , y=250;//變數(位置)精細
float vx=1.0 , vy = -0.5 ;
void draw(){
  ellipse( x, y, 10, 10 );//橢圓
  x = x + vx;
  y = y + vy;
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx; 
}
