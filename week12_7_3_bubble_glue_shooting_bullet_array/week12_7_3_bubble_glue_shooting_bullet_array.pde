//Week11 有泡泡龍的陣列
void setup(){
  size(400,500);
}
float angle=0;
void draw(){
  background(#FFFFF2);
  ellipse(200,480, 40,40);
  line(200,480, 200+60*cos(angle), 480+60*sin(angle));
  ellipse(bulletX, bulletY, 20,20);
  for(int i=0; i<4; i++){//for(int y=10; y<=70; y+=20){
    for(int j=0; j<20; j++){//for(int x=10; x<490; x+=20){
      if(bubble[i][j]==1)fill(255,255,0);
      else noFill();
      ellipse(10+j*20, 10+i*20, 20,20);//ellipse(x,y,20,20);
    }
  }
  if(bulletFlying){
    bulletX += bulletVX;
    bulletY += bulletVY;
    if(bulletY<10) bulletFlying=false;
  }
}
int [][]bubble=new int[4][20];
void mouseDragged(){
  angle += radians(mouseX-pmouseX);
}
boolean bulletFlying=false;
float bulletX=200, bulletY = 480, bulletVX=0, bulletVY=0;
void keyPressed(){
  if(key==' '){
    bulletFlying=true;
    bulletVX = 2*cos(angle);
    bulletVY = 2*sin(angle);
  }
}
