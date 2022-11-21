//有個大黑洞,可以吸進很多物質,然後越來越大
//Q:如何用 keyboard 來移動黑洞

void setup(){
  size(500,500);
}
void draw(){
  background(#FFFFF2);
  fill(0);
  ellipse(holeX,holeY, holeW, holeH);
}
int holeX=250, holeY=250, holeW=20, holeH=20;
void keyPressed(){
  if(keyCode==LEFT) holeX--;
  if(keyCode==RIGHT) holeX++;
  if(keyCode==UP) holeY--;
  if(keyCode==DOWN) holeY++;
}
