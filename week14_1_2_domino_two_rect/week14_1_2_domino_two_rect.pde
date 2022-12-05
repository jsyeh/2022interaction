int dominoX, dominoY;

void setup(){
  size(500,500);
}
void draw(){
  background(#FFFFF2);
  fill(50);
  drawDomino(dominoX, dominoY);
}
void drawDomino(int x, int y)
{
  rect(x+60,y, 60,60);
  rect(x,y, 60,60);  
}
