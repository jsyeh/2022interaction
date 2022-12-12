//好玩的撞球遊戲（8 Ball Quick Fire Pool）
void setup(){
  size(600,400);
}
float ballX=80, ballY=200;
void draw(){
  background(#3F60D1);
  ellipse(ballX, ballY, 20,20);
  float angle = atan2(mouseY-ballY, mouseX-ballX);
  strokeWeight(10); stroke(#FFFF00);
  line(ballX, ballY, ballX+cos(angle)*100, ballY+sin(angle)*100 );
  strokeWeight(1); stroke(0);
  line(ballX, ballY, mouseX, mouseY);
}
