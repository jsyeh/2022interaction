//想要做出撞球/彈珠台
//球互相撞
//這個程式有錯, 入射角 != 反射角, 因為另一個球也會動
float ballX=100, ballY=150, ballVX=0, ballVY=0; //我們
float Ax=400, Ay=150, Avx=0, Avy=0;//Ball A 被打的球
void setup(){
  size(500,300);
}
void draw(){
  background(#4AD161);
  ellipse(ballX, ballY, 30,30);
  ellipse(Ax, Ay, 30, 30);
  if(ballX+ballVX>500-15 || ballX+ballVX<15){
    ballVX=-ballVX;
  }
  if(ballY+ballVY>300-15 || ballY+ballVY<15){
    ballVY=-ballVY;
  }
  if(Ax+Avx>500-15 || Ax+Avx<15){
    Avx = - Avx;
  }
  if(Ay+Avy>300-15 || Ay+Avy<15){
    Avy = - Avy;
  }
  if( collision() ){
  }else{
  }    
    ballX+=ballVX;
    ballY+=ballVY;
    Ax+=Avx;
    Ay+=Avy;
  
  ballVX*=0.99;
  ballVY*=0.99;
  Avx *=0.99;
  Avy *=0.99;
  if(abs(Avx)<0.001) Avx=0;
  if(abs(Avy)<0.001) Avy=0;
  if(abs(ballVX)<0.001) ballVX=0;
  if(abs(ballVY)<0.001) ballVY=0;
  line(ballX,ballY,mouseX,mouseY);
  line(ballX,ballY,Ax,Ay);
}
void mousePressed(){
  ballVX = (ballX-mouseX)/10.0;
  ballVY = (ballY-mouseY)/10.0;
}
boolean collision(){
  if( dist(ballX+ballVX,ballY+ballVY,Ax+Avx,Ay+Avy)<30 ){  
    drawTangent();
    drawInput();
    drawOutput();
    //ballVX=0; ballVY=0; Avx=0; Avy=0;
    return true;//有撞到
  }else return false;//沒有撞到
}
void drawTangent(){
  float cx = (ballX+Ax)/2;
  float cy = (ballY+Ay)/2;
  ellipse(cx,cy,3,3);
  float dx = (ballX-Ax);
  float dy = (ballY-Ay);
  line(cx-dy*10, cy+dx*10, cx+dy*10, cy-dx*10);
  line(cx, cy, cx-ballVX*10, cy-ballVY*10);
  {
    float ddx=ballVX, ddy=ballVY;
    nx=ballX-Ax;
    ny=ballY-Ay;
    float len = sqrt(nx*nx+ny*ny);
    nx /= len; 
    ny /= len;
    float inner = nx*ddx+ny*ddy;
    nextX=ddx-inner*nx*2;
    nextY=ddy-inner*ny*2;
    solveMV();
    
    Avx = nx*scale2;
    Avy = ny*scale2;
    
    ballVX=nextX*scale;
    ballVY=nextY*scale;
    line(cx, cy, cx+nextX, cy+nextY);
  }
}
float nx, ny;
float scale, scale2;
float nextX, nextY;
void solveMV(){
  float m1=1, m2=1;
  float vx1=ballVX, vy1=ballVY;
  float vx2=Avx, vy2=Avy;
  // m1*vx1+m2*vx2 == m1*nextX*scale + m2*nx*scale2  (*ny)
  // m1*vy1+m2*vy2 == m1*nextY*scale + m2*ny*scale2  (*nx)
  // ny*(m1*vx1+m2*vx2)-nx*(m1*vy1+m2*vy2) == (ny*m1*nextX-nx*m1*nextY)  *scale
  scale = (ny*(m1*vx1+m2*vx2)-nx*(m1*vy1+m2*vy2) ) / (ny*m1*nextX-nx*m1*nextY);
  scale2 = (m1*vx1+m2*vx2-m1*nextX*scale)/(m2*nx);
  println(scale, scale2);
  println("eq1", m1*vx1+m2*vx2, m1*nextX*scale + m2*nx*scale2);
  println("eq2", m1*vy1+m2*vy2, m1*nextY*scale + m2*ny*scale2);

}
void drawInput(){
  line(ballX,ballY, ballX+ballVX*10, ballY+ballVY*10);
}
void drawOutput(){
  float dx=ballVX*10, dy=ballVY*10;
  float nx=ballX-Ax, ny=ballY-Ay;
  float len = sqrt(nx*nx+ny*ny);
  nx /= len; 
  ny /= len;
  float inner = nx*dx+ny*dy;
  nextX=dx-inner*nx*2;
  nextY=dy-inner*ny*2;
  line(ballX,ballY, ballX+nextX, ballY+nextY);
}
