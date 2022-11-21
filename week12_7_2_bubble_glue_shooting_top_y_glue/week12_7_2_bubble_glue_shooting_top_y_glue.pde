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
  if(bulletFlying){
    bulletX += bulletVX;
    bulletY += bulletVY;
    if(bulletY<10) bulletFlying=false;
  }
}
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
