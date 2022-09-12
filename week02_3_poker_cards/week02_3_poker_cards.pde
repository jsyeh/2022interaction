void setup(){
  size(500,500);
}
int W=25;
void draw(){
  drawPokerCard(100,100, "S4");//使用函式
  drawPokerCard(130,150, "H3");//使用函式
  drawPokerCard(160,200, "D5");//使用函式
  drawPokerCard(190,250, "CJ");//使用函式
}////牌面:黑桃Spade Heart, Dimand, Club
void drawPokerCard(int x, int y, String face){ //牌面
  fill(255);
  rect(x-W/2,y-W/2, 150+W, 250+W, 20); //弧度
  fill(#FF00F2);
  rect(x,y, 150, 250, 20); //弧度
  fill(0);
  textSize(40);
  text( face, x, y+40 );
}
