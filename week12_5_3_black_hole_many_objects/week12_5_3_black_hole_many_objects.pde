//有個大黑洞,可以吸進很多物質,然後越來越大
//Q:如何用 keyboard 來移動黑洞

float [] objectX = new float[20];
float [] objectY = new float[20];
void setup(){
  size(500,500);
  for(int i=0; i<20; i++){
    objectX[i]=random(500);
    objectY[i]=random(500);
  }
}
void draw(){
  background(#FFFFF2);
  fill(255,255,0);
  for(int i=0; i<20; i++){
    ellipse(objectX[i],objectY[i], 10, 10);
    if( dist(holeX,holeY, objectX[i],objectY[i])< (holeW+10)/2 ){
      holeW+=10;
      holeH+=10;
      objectX[i]=-100;
      objectY[i]=-100;
    }
  }

  fill(0);
  ellipse(holeX,holeY, holeW, holeH);
  holeX += holeVX;
  holeY += holeVY;
}
int holeX=250, holeY=250, holeW=20, holeH=20, holeVX=0, holeVY=0;
void keyPressed(){
  if(keyCode==LEFT) holeVX=-1;
  if(keyCode==RIGHT) holeVX=1;
  if(keyCode==UP) holeVY=-1;
  if(keyCode==DOWN) holeVY=1;
}
void keyReleased(){
  if(keyCode==LEFT) holeVX=0;
  if(keyCode==RIGHT) holeVX=0;
  if(keyCode==UP) holeVY=0;
  if(keyCode==DOWN) holeVY=0;  
}
