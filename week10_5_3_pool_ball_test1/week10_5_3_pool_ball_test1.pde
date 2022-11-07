void setup(){
  size(600,400);
}
float ballX=100, ballY=200;
float ballVX=1, ballVY=0.3;
void draw(){
  ellipse(ballX,ballY, 30,30);
  if(mousePressed){
    ballX += ballVX;
    ballY += ballVY;
  }
  
  ellipse(400,350, 100,100);
}
