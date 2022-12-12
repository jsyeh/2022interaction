//好玩的撞球遊戲（8 Ball Quick Fire Pool）
PImage imgPhoto;
void setup(){
  size(640,400);
  imgPhoto = loadImage("photo.png");
}
float ballX=180, ballY=200, angle=0;
boolean shooting=false;
void draw(){
  background(imgPhoto);
  ellipse(ballX, ballY, 20,20);
  angle = atan2(mouseY-ballY, mouseX-ballX);
  if(shooting==false){
    strokeWeight(10); stroke(#FFFF00);
    line(ballX, ballY, ballX+cos(angle)*100, ballY+sin(angle)*100 );
    strokeWeight(5); stroke(#0000FF);
    line(ballX, ballY, ballX+cos(angle)*len0, ballY+sin(angle)*len0 );
    strokeWeight(3); stroke(#00FF00);
    line(ballX, ballY, ballX+cos(angle)*len0, ballY+sin(angle)*len0 );
    strokeWeight(1); stroke(0);
    line(ballX, ballY, mouseX, mouseY);
  }
  for(int i=0; i<6; i++){
    ellipse(holeX[i], holeY[i], 30, 30);
    if(shooting && dist(ballX, ballY, holeX[i], holeY[i])<30 ){
      score+=100;
      reset();
      println(score);
    }
  }
  
  ballX += vx/10;
  ballY += vy/10;
}
float [] holeX = {38, 319, 600, 38, 319, 600};
float [] holeY = {63, 63, 63, 368, 368, 368};
float score=0;
float len0=0, len1=0, vx=0, vy=0;
void mousePressed(){
  len0 = dist(ballX, ballY, mouseX, mouseY);
}
void mouseReleased(){
  len1 = dist(ballX, ballY, mouseX, mouseY);
  float v = len1-len0;
  vx = - v * cos(angle);
  vy = - v * sin(angle);
  shooting=true;
}
void mouseMoved(){
  //println(mouseX, mouseY);
}
void keyPressed(){
  if(key=='r') reset();
}
void reset(){
  ballX=180;
  ballY=200;
  shooting=false;
  vx=0;
  vy=0;
}
