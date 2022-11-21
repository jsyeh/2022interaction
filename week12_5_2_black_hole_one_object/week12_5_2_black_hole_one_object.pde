//有個大黑洞,可以吸進很多物質,然後越來越大
//Q:如何用 keyboard 來移動黑洞

float objectX, objectY;
void setup(){
  size(500,500);
  objectX=random(500);
  objectY=random(500);
}
void draw(){
  background(#FFFFF2);
  fill(255,255,0);
  ellipse(objectX,objectY, 10, 10);

  fill(0);
  ellipse(holeX,holeY, holeW, holeH);

  if( dist(holeX,holeY, objectX,objectY)< (holeW+10)/2 ){
    holeW+=10;
    holeH+=10;
    objectX=-100;
    objectY=-100;
  }
}
int holeX=250, holeY=250, holeW=20, holeH=20;
void keyPressed(){
  if(keyCode==LEFT) holeX--;
  if(keyCode==RIGHT) holeX++;
  if(keyCode==UP) holeY--;
  if(keyCode==DOWN) holeY++;
}
