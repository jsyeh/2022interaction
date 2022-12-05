int dominoX, dominoY;
int dominoN1, dominoN2;
void setup(){
  size(500,500);
  dominoX = (int) random(100,400);
  dominoY = (int) random(100,400);
  dominoN1 = (int) random(10);
  dominoN2 = (int) random(10);
  textSize(30);
  textAlign(CENTER,CENTER);
}
void draw(){
  background(#FFFFF2);
  drawDomino(dominoX, dominoY);
}
void drawDomino(int x, int y)
{
  fill(50);
  rect(x+60,y, 60,60);
  rect(x,y, 60,60);
  fill(255);
  text(dominoN1, x+30,y+30);
  text(dominoN2, x+60+30,y+30);
}
