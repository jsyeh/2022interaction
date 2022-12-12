//好玩的撞球遊戲（8 Ball Quick Fire Pool）
void setup(){
  size(600,400);
}
float ballX=180, ballY=200, angle=0;
boolean shooting=false;
void draw(){
  background(#3F60D1);
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
  ballX += vx/10;
  ballY += vy/10;
}
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
