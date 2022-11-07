void setup(){
  size(600,400);
  ball = new PVector(100,200);
  ballV = new PVector(1, 0.3);
  big = new PVector(400,350);
}
PVector ball, ballV, big;
void draw(){
  ellipse( ball.x, ball.y, 30, 30);
  if(mousePressed){
    ball.add(ballV);
  }
  ellipse(big.x, big.y, 100,100);
  if( dist(big.x, big.y, ball.x, ball.y)<=65 ){///碰到了
    PVector cc = PVector.sub(big, ball).normalize();
    line(ball.x, ball.y, ball.x+cc.x, ball.y+cc.y);
    PVector cut_plane = new PVector(cc.y, -cc.x).normalize();
    PVector v1 = cut_plane.mult( PVector.dot(ballV, cut_plane) );
    PVector v2 = cc.mult( - PVector.dot(ballV, cc) );
    ballV = PVector.add(v1,v2);
    
  }
}
